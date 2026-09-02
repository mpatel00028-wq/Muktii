<?php
/**
 * Admin Login Page
 * Salon Management System
 * Uses Procedural MySQLi ONLY
 */

require_once __DIR__ . '/../includes/db.php';
require_once __DIR__ . '/../includes/csrf.php';
require_once __DIR__ . '/../includes/flash.php';

// Redirect if already logged in
if (isset($_SESSION['admin_id']) && !empty($_SESSION['admin_id'])) {
    header("Location: index.php");
    exit();
}

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $token = isset($_POST['csrf_token']) ? $_POST['csrf_token'] : '';
    if (!verify_csrf_token($token)) {
        set_flash('danger', 'Security validation failed (Invalid CSRF token). Please try again.');
        header("Location: login.php");
        exit();
    }

    $email = isset($_POST['email']) ? trim($_POST['email']) : '';
    $password = isset($_POST['password']) ? trim($_POST['password']) : '';

    if (empty($email) || empty($password)) {
        $error = "Please fill in all required fields.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Please enter a valid email address.";
    } else {
        $email_escaped = mysqli_real_escape_string($conn, $email);
        $sql = "SELECT admin_id, name, email, password, status FROM admins WHERE email = '$email_escaped' LIMIT 1";
        $result = mysqli_query($conn, $sql);

        if ($result && mysqli_num_rows($result) > 0) {
            $admin = mysqli_fetch_assoc($result);

            if ($admin['status'] !== 'active') {
                $error = "Your admin account is inactive. Please contact system administrator.";
            } else {
                $stored_password = $admin['password'];
                $password_matched = false;
                $needs_rehash = false;

                // Check standard password_verify
                if (password_verify($password, $stored_password)) {
                    $password_matched = true;
                } 
                // Legacy plaintext fallback check
                elseif ($password === $stored_password) {
                    $password_matched = true;
                    $needs_rehash = true;
                }

                if ($password_matched) {
                    // One-time legacy password migration to password_hash
                    if ($needs_rehash) {
                        $new_hash = password_hash($password, PASSWORD_DEFAULT);
                        $new_hash_escaped = mysqli_real_escape_string($conn, $new_hash);
                        $admin_id_int = (int)$admin['admin_id'];
                        $update_sql = "UPDATE admins SET password = '$new_hash_escaped' WHERE admin_id = $admin_id_int";
                        mysqli_query($conn, $update_sql);
                    }

                    // Regenerate session for security
                    session_regenerate_id(true);
                    $_SESSION['admin_id'] = (int)$admin['admin_id'];

                    set_flash('success', 'Welcome back, ' . htmlspecialchars($admin['name']) . '!');
                    header("Location: index.php");
                    exit();
                } else {
                    $error = "Invalid email or password.";
                }
            }
        } else {
            $error = "Invalid email or password.";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Salon Management System</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome 6 Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Admin CSS -->
    <link rel="stylesheet" href="../assets/css/admin.css">
</head>
<body class="login-body">

<div class="login-card">
    <div class="login-header">
        <div class="login-logo">
            <i class="fas fa-scissors"></i>
        </div>
        <h2 class="login-title">Salon Admin Panel</h2>
        <p class="login-subtitle">Sign in to manage your salon operations</p>
    </div>

    <?php display_flash(); ?>

    <?php if (!empty($error)): ?>
        <div class="alert alert-danger alert-dismissible fade show d-flex align-items-center mb-4" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i>
            <div><?php echo htmlspecialchars($error); ?></div>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <?php endif; ?>

    <form action="login.php" method="POST" autocomplete="off">
        <?php echo csrf_field(); ?>

        <div class="mb-3">
            <label for="email" class="form-label font-weight-600">Email Address</label>
            <div class="input-group">
                <span class="input-group-text bg-light border-end-0"><i class="fas fa-envelope text-muted"></i></span>
                <input type="email" class="form-control border-start-0" id="email" name="email" placeholder="admin@salon.com" required value="<?php echo isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>">
            </div>
        </div>

        <div class="mb-4">
            <label for="password" class="form-label font-weight-600">Password</label>
            <div class="input-group">
                <span class="input-group-text bg-light border-end-0"><i class="fas fa-lock text-muted"></i></span>
                <input type="password" class="form-control border-start-0" id="password" name="password" placeholder="••••••••" required>
            </div>
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-accent py-2 font-weight-600">
                <i class="fas fa-sign-in-alt me-2"></i> Sign In to Dashboard
            </button>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
