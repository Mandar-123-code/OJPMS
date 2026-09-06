<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>Edit Profile | SMARTHIRE</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@500;600;700&display=swap"
        rel="stylesheet">

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet" href="css/global.css">

    <style>

        :root {
            --ink: #13211e;
            --mint: #d9f67f;
            --coral: #f27961;
            --paper: #f4f1e8;
            --white: #ffffff;
            --line: #d8ded5;
            --muted: #69766f;
            --soft: #eef2eb;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: var(--paper);
            color: var(--ink);

            font-family: 'DM Sans', sans-serif;
        }

        /* =====================================================
           SIDEBAR
        ===================================================== */

        .sidebar {
            width: 250px;
            height: 100vh;

            position: fixed;
            left: 0;
            top: 0;

            background: var(--ink);
            color: white;

            padding: 25px 16px;

            z-index: 100;
        }

        .sidebar-logo {
            display: flex;
            align-items: center;
            gap: 12px;

            padding: 4px 10px 30px;
        }

        .sidebar-logo-icon {
            width: 43px;
            height: 43px;

            border-radius: 12px;

            background: var(--mint);
            color: var(--ink);

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 18px;
        }

        .sidebar-logo-text h2 {
            margin: 0;

            font-family: 'Space Grotesk', sans-serif;

            font-size: 21px;
            letter-spacing: -.6px;
        }

        .sidebar-logo-text span {
            display: block;

            margin-top: 2px;

            color: #aab5b0;

            font-size: 11px;
        }

        .sidebar-nav {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .sidebar-nav a {
            color: #b8c1bd;

            text-decoration: none;

            padding: 12px 13px;

            border-radius: 10px;

            display: flex;
            align-items: center;

            gap: 12px;

            font-size: 14px;
            font-weight: 500;

            transition: all .2s ease;
        }

        .sidebar-nav a i {
            width: 18px;
            text-align: center;
        }

        .sidebar-nav a:hover {
            color: white;

            background: rgba(255,255,255,.07);

            transform: translateX(2px);
        }

        .sidebar-nav a.active {
            background: var(--mint);
            color: var(--ink);

            font-weight: 700;
        }

        .nav-divider {
            height: 1px;

            margin: 18px 10px;

            background: rgba(255,255,255,.1);
        }

        .sidebar-nav .logout-link:hover {
            color: #ff9c8a;
            background: rgba(242,121,97,.1);
        }


        /* =====================================================
           MAIN CONTENT
        ===================================================== */

        .main-content {
            margin-left: 250px;

            min-height: 100vh;

            padding: 0 42px 60px;
        }


        /* =====================================================
           TOPBAR
        ===================================================== */

        .topbar {
            min-height: 82px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            border-bottom: 1px solid var(--line);
        }

        .ep-back-btn {
            display: inline-flex;
            align-items: center;
            gap: 9px;

            color: var(--muted);

            text-decoration: none;

            font-size: 13px;
            font-weight: 600;

            transition: color .2s ease;
        }

        .ep-back-btn:hover {
            color: var(--ink);
        }

        .topbar-right {
            display: flex;
            align-items: center;
        }


        /* =====================================================
           BUTTON
        ===================================================== */

        .btn {
            display: inline-flex;

            align-items: center;
            justify-content: center;

            gap: 8px;

            padding: 10px 15px;

            border-radius: 10px;

            text-decoration: none;

            font-size: 13px;
            font-weight: 700;

            transition: all .2s ease;
        }

        .btn-secondary {
            color: var(--ink);

            background: white;

            border: 1px solid var(--line);
        }

        .btn-secondary:hover {
            transform: translateY(-1px);

            box-shadow: 0 7px 18px rgba(19,33,30,.08);
        }


        /* =====================================================
           HEADER
        ===================================================== */

        .ep-header-card {
            max-width: 1120px;

            margin: 34px auto 22px;

            padding: 28px 30px;

            border-radius: 20px;

            background: var(--ink);

            color: white;

            position: relative;

            overflow: hidden;

            animation: fadeUp .5s ease both;
        }

        .ep-header-card::after {
            content: "";

            width: 180px;
            height: 180px;

            position: absolute;

            right: -55px;
            top: -85px;

            border-radius: 50%;

            background: var(--mint);

            opacity: .9;
        }

        .ep-header-card::before {
            content: "";

            width: 90px;
            height: 90px;

            position: absolute;

            right: 90px;
            bottom: -55px;

            border-radius: 50%;

            background: var(--coral);

            opacity: .75;
        }

        .ep-header-content {
            position: relative;
            z-index: 2;
        }

        .ep-eyebrow {
            display: flex;
            align-items: center;
            gap: 7px;

            color: #aeb9b4;

            font-size: 10px;
            font-weight: 700;

            letter-spacing: 1.2px;

            text-transform: uppercase;

            margin-bottom: 9px;
        }

        .ep-title {
            margin: 0;

            font-family: 'Space Grotesk', sans-serif;

            font-size: 30px;

            letter-spacing: -1px;
        }

        .ep-subtitle {
            margin: 8px 0 0;

            max-width: 620px;

            color: #bdc7c2;

            font-size: 13.5px;

            line-height: 1.6;
        }


        /* =====================================================
           STATS
        ===================================================== */

        .stats-grid {
            max-width: 1120px;

            margin: 0 auto 22px !important;

            padding: 0 !important;

            display: grid;

            grid-template-columns: repeat(3, 1fr);

            gap: 14px;
        }

        .stat-card {
            background: white;

            border: 1px solid var(--line);

            border-radius: 15px;

            padding: 17px 18px;

            position: relative;

            transition:
                transform .2s ease,
                box-shadow .2s ease;
        }

        .stat-card:hover {
            transform: translateY(-2px);

            box-shadow: 0 10px 24px rgba(19,33,30,.07);
        }

        .stat-icon {
            position: absolute;

            right: 17px;
            top: 18px;

            color: #78857e;

            font-size: 15px;
        }

        .stat-number {
            font-family: 'Space Grotesk', sans-serif;

            font-size: 22px;
            font-weight: 700;

            margin-bottom: 3px;
        }

        .stat-label {
            color: var(--muted);

            font-size: 11px;
        }


        /* =====================================================
           CONTENT
        ===================================================== */

        .ep-content {
            max-width: 1120px;

            margin: 0 auto;

            display: grid;

            grid-template-columns: 330px minmax(0,1fr);

            gap: 22px;

            align-items: start;
        }


        /* =====================================================
           PROFILE PREVIEW
        ===================================================== */

        .ep-profile-card {
            min-height: 410px;

            padding: 30px 27px;

            border-radius: 22px;

            background: white;

            border: 1px solid var(--line);

            position: relative;

            overflow: hidden;

            box-shadow: 0 14px 32px rgba(19,33,30,.06);

            animation: fadeUp .55s .05s ease both;
        }

        .ep-profile-card::after {
            content: "";

            width: 145px;
            height: 145px;

            position: absolute;

            right: -55px;
            bottom: -60px;

            background: var(--mint);

            border-radius: 50%;

            opacity: .55;
        }

        .ep-preview-label {
            color: #718078;

            font-size: 10px;

            font-weight: 800;

            text-transform: uppercase;

            letter-spacing: 1.1px;
        }

        .ep-avatar-circle {
            width: 82px;
            height: 82px;

            margin: 31px 0 20px;

            border-radius: 22px;

            background: var(--ink);

            color: var(--mint);

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 30px;

            position: relative;
            z-index: 2;

            transition: transform .25s ease;
        }

        .ep-profile-card:hover .ep-avatar-circle {
            transform: rotate(-3deg) scale(1.03);
        }

        .ep-profile-card h2 {
            margin: 0;

            position: relative;
            z-index: 2;

            font-family: 'Space Grotesk', sans-serif;

            font-size: 25px;

            letter-spacing: -.7px;
        }

        .ep-role-text {
            margin: 7px 0 20px;

            color: var(--muted);

            font-size: 13px;

            font-weight: 600;

            text-transform: capitalize;
        }

        .ep-profile-line {
            position: relative;
            z-index: 2;

            padding: 16px 0;

            border-top: 1px solid #e7ebe5;

            display: flex;
            align-items: flex-start;

            gap: 10px;
        }

        .ep-profile-line i {
            color: #748178;

            width: 17px;

            margin-top: 2px;
        }

        .ep-profile-line span {
            color: #68756f;

            font-size: 12px;

            line-height: 1.5;
        }

        .ep-tip {
            position: absolute;

            z-index: 2;

            left: 27px;
            right: 27px;
            bottom: 25px;

            color: #65736c;

            font-size: 11.5px;

            line-height: 1.55;
        }


        /* =====================================================
           FORM
        ===================================================== */

        .ep-form-card {
            background: white;

            border: 1px solid var(--line);

            border-radius: 22px;

            padding: 30px 32px;

            box-shadow: 0 14px 32px rgba(19,33,30,.06);

            animation: fadeUp .55s .1s ease both;
        }

        .ep-form-heading {
            display: flex;
            align-items: center;
            gap: 11px;

            margin-bottom: 7px;
        }

        .ep-form-heading-icon {
            width: 38px;
            height: 38px;

            border-radius: 10px;

            background: var(--soft);

            display: flex;
            align-items: center;
            justify-content: center;

            color: var(--ink);

            font-size: 15px;
        }

        .ep-form-title {
            margin: 0;

            font-family: 'Space Grotesk', sans-serif;

            font-size: 20px;

            letter-spacing: -.4px;
        }

        .ep-form-description {
            margin: 0 0 26px 49px;

            color: var(--muted);

            font-size: 12.5px;

            line-height: 1.55;
        }


        /* =====================================================
           FORM GROUP
        ===================================================== */

        .form-group {
            margin-bottom: 19px;
        }

        .form-group label {
            display: block;

            margin-bottom: 7px;

            color: #34433e;

            font-size: 12.5px;

            font-weight: 700;
        }

        .required {
            color: var(--coral);
        }

        .form-group input {
            width: 100%;

            height: 47px;

            padding: 0 14px;

            border: 1px solid #d6ddd4;

            border-radius: 10px;

            background: #fbfcfa;

            color: var(--ink);

            outline: none;

            font-family: 'DM Sans', sans-serif;

            font-size: 13.5px;

            transition: all .2s ease;
        }

        .form-group input:hover {
            background: white;

            border-color: #bdc8bf;
        }

        .form-group input:focus {
            background: white;

            border-color: var(--ink);

            box-shadow: 0 0 0 3px rgba(217,246,127,.42);
        }

        .form-group input[readonly] {
            background: #f0f2ed;

            color: #6e7b74;

            cursor: not-allowed;
        }


        /* =====================================================
           PASSWORD
        ===================================================== */

        .password-wrapper {
            position: relative;
        }

        .password-wrapper input {
            padding-right: 48px;
        }

        .pw-toggle-ep {
            position: absolute;

            right: 12px;
            top: 50%;

            transform: translateY(-50%);

            border: none;

            background: transparent;

            color: #7c8781;

            cursor: pointer;

            padding: 5px;

            transition: color .2s ease;
        }

        .pw-toggle-ep:hover {
            color: var(--ink);
        }

        .field-help {
            display: block;

            margin-top: 6px;

            color: #89938e;

            font-size: 10.5px;
        }


        /* =====================================================
           ROLE
        ===================================================== */

        .role-field {
            position: relative;
        }

        .role-lock {
            position: absolute;

            right: 14px;
            top: 50%;

            transform: translateY(-15%);

            color: #89938e;

            font-size: 12px;
        }


        /* =====================================================
           SUBMIT
        ===================================================== */

        .form-footer {
            margin-top: 26px;

            padding-top: 20px;

            border-top: 1px solid #e5e9e2;

            display: flex;

            align-items: center;

            justify-content: space-between;

            gap: 15px;
        }

        .security-note {
            display: flex;

            align-items: center;

            gap: 8px;

            color: #78847e;

            font-size: 11px;
        }

        .security-note i {
            color: #71964c;
        }

        .update-btn {
            border: none;

            border-radius: 10px;

            background: var(--ink);

            color: white;

            padding: 13px 21px;

            font-family: 'DM Sans', sans-serif;

            font-size: 13px;

            font-weight: 700;

            cursor: pointer;

            display: inline-flex;

            align-items: center;
            justify-content: center;

            gap: 9px;

            transition: all .2s ease;
        }

        .update-btn:hover {
            background: #1e302c;

            transform: translateY(-2px);

            box-shadow: 0 9px 22px rgba(19,33,30,.16);
        }

        .update-btn:active {
            transform: translateY(0);
        }


        /* =====================================================
           ANIMATION
        ===================================================== */

        @keyframes fadeUp {

            from {
                opacity: 0;
                transform: translateY(12px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }

        }


        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width: 1000px) {

            .sidebar {
                width: 220px;
            }

            .main-content {
                margin-left: 220px;

                padding-left: 25px;
                padding-right: 25px;
            }

            .ep-content {
                grid-template-columns: 1fr;
            }

            .ep-profile-card {
                min-height: 330px;
            }

        }


        @media (max-width: 700px) {

            .sidebar {
                position: relative;

                width: 100%;
                height: auto;

                padding: 15px;
            }

            .sidebar-logo {
                padding-bottom: 15px;
            }

            .sidebar-nav {
                flex-direction: row;
                flex-wrap: wrap;
            }

            .sidebar-nav a {
                padding: 9px 10px;

                font-size: 12px;
            }

            .nav-divider {
                display: none;
            }

            .main-content {
                margin-left: 0;

                padding: 0 15px 40px;
            }

            .topbar {
                min-height: 70px;
            }

            .topbar-right {
                display: none;
            }

            .ep-header-card {
                padding: 24px 21px;
            }

            .ep-title {
                font-size: 26px;
            }

            .stats-grid {
                grid-template-columns: 1fr !important;
            }

            .ep-form-card {
                padding: 23px 19px;
            }

            .form-footer {
                flex-direction: column;

                align-items: stretch;
            }

            .security-note {
                justify-content: center;
            }

            .update-btn {
                width: 100%;
            }

        }

    </style>

</head>


<body>


<!-- =====================================================
     SIDEBAR
===================================================== -->

<div class="sidebar">

    <div class="sidebar-logo">

        <div class="sidebar-logo-icon">
            <i class="fa-solid fa-briefcase"></i>
        </div>

        <div class="sidebar-logo-text">

            <h2>SMARTHIRE</h2>

            <span>Job Portal</span>

        </div>

    </div>


    <nav class="sidebar-nav">

        <a href="user-dashboard.jsp">

            <i class="fa-solid fa-gauge"></i>

            Dashboard

        </a>


        <a href="profile.jsp" class="active">

            <i class="fa-solid fa-user"></i>

            Profile

        </a>


        <a href="viewjobs">

            <i class="fa-solid fa-briefcase"></i>

            Jobs

        </a>


        <a href="home.jsp">

            <i class="fa-solid fa-house"></i>

            Home

        </a>


        <div class="nav-divider"></div>


        <a href="logout" class="logout-link">

            <i class="fa-solid fa-right-from-bracket"></i>

            Logout

        </a>

    </nav>

</div>



<!-- =====================================================
     MAIN
===================================================== -->

<div class="main-content">


    <!-- TOPBAR -->

    <div class="topbar">

        <div class="topbar-left">

            <a href="user-dashboard.jsp"
               class="ep-back-btn">

                <i class="fa-solid fa-arrow-left"></i>

                Dashboard

            </a>

        </div>


        <div class="topbar-right">

            <a href="logout"
               class="btn btn-secondary">

                <i class="fa-solid fa-right-from-bracket"></i>

                Logout

            </a>

        </div>

    </div>



    <!-- HEADER -->

    <div class="ep-header-card">

        <div class="ep-header-content">

            <div class="ep-eyebrow">

                <i class="fa-solid fa-user-pen"></i>

                Account Settings

            </div>


            <h1 class="ep-title">

                Keep your profile up to date

            </h1>


            <p class="ep-subtitle">

                Maintain accurate contact information so recruiters can
                reach you easily when your profile matches an opportunity.

            </p>

        </div>

    </div>



    <!-- STATS -->

    <div class="stats-grid">

        <div class="stat-card">

            <i class="fa-solid fa-circle-check stat-icon"></i>

            <div class="stat-number">
                100%
            </div>

            <div class="stat-label">
                Profile Status
            </div>

        </div>


        <div class="stat-card">

            <i class="fa-solid fa-id-badge stat-icon"></i>

            <div class="stat-number"
                 style="font-size:16px;">

                ${user.role}

            </div>

            <div class="stat-label">
                Current Role
            </div>

        </div>


        <div class="stat-card">

            <i class="fa-solid fa-signal stat-icon"></i>

            <div class="stat-number"
                 style="font-size:18px; color:#057642;">

                Active

            </div>

            <div class="stat-label">
                Account Status
            </div>

        </div>

    </div>



    <!-- CONTENT -->

    <div class="ep-content">


        <!-- =================================================
             PROFILE PREVIEW
        ================================================== -->

        <div class="ep-profile-card">

            <div class="ep-preview-label">

                Profile Preview

            </div>


            <div class="ep-avatar-circle">

                <i class="fa-solid fa-user"></i>

            </div>


            <h2>
                ${user.name}
            </h2>


            <p class="ep-role-text">
                ${user.role}
            </p>


            <div class="ep-profile-line">

                <i class="fa-solid fa-envelope"></i>

                <span>
                    ${user.email}
                </span>

            </div>


            <div class="ep-profile-line">

                <i class="fa-solid fa-user-check"></i>

                <span>
                    Your profile is currently active and available for job applications.
                </span>

            </div>


            <div class="ep-tip">

                <i class="fa-solid fa-lightbulb"></i>

                A complete and updated profile helps recruiters understand
                your background and contact you about relevant opportunities.

            </div>

        </div>



        <!-- =================================================
             FORM
        ================================================== -->

        <div class="ep-form-card">


            <div class="ep-form-heading">

                <div class="ep-form-heading-icon">

                    <i class="fa-solid fa-user-pen"></i>

                </div>


                <h3 class="ep-form-title">

                    Personal Information

                </h3>

            </div>


            <p class="ep-form-description">

                Review your account information carefully before saving
                your changes.

            </p>


            <form action="edituserprofile" method="post">


                <!-- USER ID -->

                <div class="form-group">

                    <label for="epId">

                        User ID

                    </label>

                    <input type="number"
                           id="epId"
                           name="id"
                           value="${user.id}"
                           readonly>

                    <span class="field-help">

                        Your unique account identifier cannot be changed.

                    </span>

                </div>



                <!-- NAME -->

                <div class="form-group">

                    <label for="epName">

                        Full Name

                        <span class="required">*</span>

                    </label>

                    <input type="text"
                           id="epName"
                           name="name"
                           value="${user.name}"
                           placeholder="Enter your full name"
                           required>

                </div>



                <!-- EMAIL -->

                <div class="form-group">

                    <label for="epEmail">

                        Email Address

                        <span class="required">*</span>

                    </label>

                    <input type="email"
                           id="epEmail"
                           name="email"
                           value="${user.email}"
                           placeholder="Enter your email address"
                           required>

                    <span class="field-help">

                        Recruiters may use this address to contact you regarding applications.

                    </span>

                </div>



                <!-- PASSWORD -->

                <div class="form-group">

                    <label for="epPassword">

                        Password

                        <span class="required">*</span>

                    </label>


                    <div class="password-wrapper">

                        <input type="password"
                               id="epPassword"
                               name="password"
                               value="${user.password}"
                               required>


                        <button type="button"
                                class="pw-toggle-ep"
                                onclick="toggleEpPw()"
                                tabindex="-1"
                                aria-label="Show or hide password">

                            <i class="fa-solid fa-eye"
                               id="epEyeIcon"></i>

                        </button>

                    </div>


                    <span class="field-help">

                        Your password is used to protect access to your SMARTHIRE account.

                    </span>

                </div>



                <!-- ROLE -->

                <div class="form-group">

                    <label for="epRole">

                        Account Role

                    </label>


                    <div class="role-field">

                        <input type="text"
                               id="epRole"
                               name="role"
                               value="${user.role}"
                               readonly>


                        <i class="fa-solid fa-lock role-lock"></i>

                    </div>


                    <span class="field-help">

                        Account roles are managed by the platform and cannot be changed from your profile.

                    </span>

                </div>



                <!-- FOOTER -->

                <div class="form-footer">

                    <div class="security-note">

                        <i class="fa-solid fa-shield-halved"></i>

                        Keep your account information secure.

                    </div>


                    <button type="submit"
                            class="update-btn">

                        <i class="fa-solid fa-floppy-disk"></i>

                        Save Profile Changes

                    </button>

                </div>


            </form>

        </div>

    </div>

</div>



<!-- =====================================================
     PASSWORD SCRIPT
===================================================== -->

<script>

function toggleEpPw() {

    const input = document.getElementById("epPassword");

    const icon = document.getElementById("epEyeIcon");


    if (input.type === "password") {

        input.type = "text";

        icon.className = "fa-solid fa-eye-slash";

    } else {

        input.type = "password";

        icon.className = "fa-solid fa-eye";

    }

}

</script>


</body>

</html>