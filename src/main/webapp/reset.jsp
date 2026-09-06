<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Reset Password | SMARTHIRE</title>


    <!-- Fonts -->

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link
        href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@500;600;700&display=swap"
        rel="stylesheet">


    <!-- Font Awesome -->

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


    <style>

        :root {
            --ink: #13211e;
            --mint: #d9f67f;
            --coral: #f27961;
            --paper: #f4f1e8;
            --white: #ffffff;
            --muted: #718078;
            --line: #d6ddd1;
            --soft: #edf1e9;

            --gold: #c48a24;
            --gold-soft: #fff4d9;

            --shadow: 0 25px 70px rgba(19, 33, 30, 0.10);
        }


        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        body {
            min-height: 100vh;

            font-family: "DM Sans", sans-serif;

            background: var(--paper);

            color: var(--ink);
        }


        a {
            text-decoration: none;
            color: inherit;
        }


        /* =========================================
           NAVBAR
        ========================================= */

        .auth-navbar {
            height: 76px;

            display: flex;
            align-items: center;

            border-bottom: 1px solid var(--line);

            background: rgba(244, 241, 232, 0.92);

            backdrop-filter: blur(14px);

            position: relative;
            z-index: 10;
        }


        .auth-nav-container {
            width: min(1180px, calc(100% - 48px));

            margin: auto;

            display: flex;
            align-items: center;
            justify-content: space-between;
        }


        .auth-brand {
            display: flex;
            align-items: center;

            gap: 11px;
        }


        .auth-logo-icon {
            width: 40px;
            height: 40px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 12px;

            background: var(--ink);

            color: var(--mint);

            font-size: 16px;
        }


        .auth-brand-name {
            display: block;

            font-family: "Space Grotesk", sans-serif;

            font-size: 18px;
            font-weight: 700;

            letter-spacing: -0.5px;
        }


        .auth-brand-sub {
            display: block;

            margin-top: 1px;

            color: var(--muted);

            font-size: 9px;
            font-weight: 500;
        }


        .auth-nav-links {
            display: flex;
            align-items: center;

            gap: 9px;
        }


        .auth-nav-link {
            padding: 9px 13px;

            color: #52615a;

            font-size: 12px;
            font-weight: 600;

            border-radius: 8px;

            transition: 0.2s ease;
        }


        .auth-nav-link:hover {
            color: var(--ink);

            background: rgba(19, 33, 30, 0.05);
        }


        .auth-nav-btn {
            padding: 9px 15px;

            border-radius: 8px;

            background: var(--ink);

            color: white;

            font-size: 11px;
            font-weight: 700;

            transition: 0.2s ease;
        }


        .auth-nav-btn:hover {
            transform: translateY(-1px);

            box-shadow: 0 7px 16px rgba(19, 33, 30, 0.15);
        }


        /* =========================================
           PAGE
        ========================================= */

        .auth-page {
            min-height: calc(100vh - 76px);

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 55px 24px 70px;

            position: relative;
            overflow: hidden;
        }


        .auth-page::before {
            content: "";

            position: absolute;

            width: 430px;
            height: 430px;

            border-radius: 50%;

            background: rgba(217, 246, 127, 0.20);

            top: -220px;
            left: -160px;

            filter: blur(2px);
        }


        .auth-page::after {
            content: "";

            position: absolute;

            width: 360px;
            height: 360px;

            border-radius: 50%;

            border: 1px solid rgba(19, 33, 30, 0.06);

            right: -150px;
            bottom: -180px;
        }


        /* =========================================
           CONTAINER
        ========================================= */

        .auth-container {
            width: min(1040px, 100%);

            min-height: 590px;

            display: grid;

            grid-template-columns: 0.95fr 1.05fr;

            overflow: hidden;

            position: relative;
            z-index: 2;

            border: 1px solid var(--line);

            border-radius: 25px;

            background: white;

            box-shadow: var(--shadow);

            animation: pageIn 0.55s ease both;
        }


        /* =========================================
           LEFT PANEL
        ========================================= */

        .auth-left {
            position: relative;

            display: flex;
            align-items: center;

            padding: 55px;

            background: var(--ink);

            color: white;

            overflow: hidden;
        }


        .auth-left::before {
            content: "";

            position: absolute;

            width: 270px;
            height: 270px;

            border: 1px solid rgba(217, 246, 127, 0.15);

            border-radius: 50%;

            right: -120px;
            top: -100px;
        }


        .auth-left::after {
            content: "";

            position: absolute;

            width: 190px;
            height: 190px;

            border-radius: 50%;

            background: rgba(242, 121, 97, 0.10);

            bottom: -90px;
            left: -70px;
        }


        .auth-left-content {
            position: relative;

            z-index: 2;

            max-width: 410px;
        }


        /* =========================================
           LOCK ICON
        ========================================= */

        .reset-lock-icon {
            width: 58px;
            height: 58px;

            display: flex;
            align-items: center;
            justify-content: center;

            margin-bottom: 28px;

            border-radius: 17px;

            background: rgba(217, 246, 127, 0.12);

            border: 1px solid rgba(217, 246, 127, 0.20);

            color: var(--mint);

            font-size: 21px;
        }


        .auth-left h1 {
            font-family: "Space Grotesk", sans-serif;

            font-size: clamp(35px, 4vw, 52px);

            line-height: 1.03;

            letter-spacing: -2.1px;
        }


        .auth-left h1 span {
            color: var(--mint);
        }


        .auth-left-description {
            max-width: 390px;

            margin-top: 20px;

            color: #aebbb5;

            font-size: 13px;

            line-height: 1.8;
        }


        /* =========================================
           FEATURES
        ========================================= */

        .auth-features {
            display: flex;
            flex-wrap: wrap;

            gap: 9px;

            margin-top: 30px;
        }


        .auth-feature {
            display: inline-flex;
            align-items: center;

            gap: 8px;

            padding: 9px 12px;

            border: 1px solid rgba(255, 255, 255, 0.10);

            border-radius: 8px;

            background: rgba(255, 255, 255, 0.045);

            color: #d7dfda;

            font-size: 10px;
            font-weight: 600;
        }


        .auth-feature i {
            color: var(--mint);

            font-size: 11px;
        }


        .auth-badge {
            display: inline-flex;
            align-items: center;

            margin-top: 32px;

            padding: 8px 11px;

            border-radius: 7px;

            background: rgba(242, 121, 97, 0.10);

            color: #f3a99b;

            font-size: 9px;
            font-weight: 700;

            letter-spacing: 0.7px;
        }


        /* =========================================
           RIGHT CARD
        ========================================= */

        .auth-card {
            display: flex;
            flex-direction: column;
            justify-content: center;

            padding: 55px 65px;
        }


        .auth-card-header {
            margin-bottom: 30px;
        }


        .auth-card-icon {
            width: 48px;
            height: 48px;

            display: flex;
            align-items: center;
            justify-content: center;

            margin-bottom: 18px;

            border-radius: 13px;

            background: var(--gold-soft);

            color: var(--gold);

            font-size: 17px;
        }


        .auth-card-header h2 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 28px;

            letter-spacing: -1px;
        }


        .subtitle {
            margin-top: 5px;

            color: var(--muted);

            font-size: 12px;
        }


        /* =========================================
           FORM
        ========================================= */

        .auth-form {
            display: flex;
            flex-direction: column;

            gap: 19px;
        }


        .auth-input-group {
            display: flex;
            flex-direction: column;

            gap: 8px;
        }


        .auth-input-group label {
            display: flex;
            align-items: center;

            gap: 7px;

            color: #3e4e47;

            font-size: 11px;
            font-weight: 700;
        }


        .auth-input-group label i {
            color: var(--coral);

            font-size: 10px;
        }


        .auth-input-group input {
            width: 100%;
            height: 48px;

            padding: 0 14px;

            outline: none;

            border: 1px solid var(--line);

            border-radius: 10px;

            background: #fbfcf9;

            color: var(--ink);

            font-family: "DM Sans", sans-serif;

            font-size: 12px;

            transition:
                border-color 0.2s ease,
                box-shadow 0.2s ease,
                background 0.2s ease;
        }


        .auth-input-group input::placeholder {
            color: #a2aca6;
        }


        .auth-input-group input:focus {
            border-color: #9daa99;

            background: white;

            box-shadow:
                0 0 0 3px rgba(217, 246, 127, 0.22);
        }


        /* =========================================
           PASSWORD
        ========================================= */

        .password-wrapper {
            position: relative;
        }


        .password-wrapper input {
            padding-right: 45px;
        }


        .pw-toggle {
            position: absolute;

            right: 13px;
            top: 50%;

            transform: translateY(-50%);

            border: none;

            background: transparent;

            color: #89948e;

            cursor: pointer;

            font-size: 13px;

            transition: color 0.2s ease;
        }


        .pw-toggle:hover {
            color: var(--ink);
        }


        /* =========================================
           RESET BUTTON
        ========================================= */

        .reset-btn {
            width: 100%;
            height: 48px;

            margin-top: 4px;

            border: none;

            border-radius: 10px;

            background: var(--ink);

            color: white;

            cursor: pointer;

            font-family: "DM Sans", sans-serif;

            font-size: 12px;
            font-weight: 700;

            transition:
                transform 0.22s ease,
                box-shadow 0.22s ease,
                background 0.22s ease;
        }


        .reset-btn:hover {
            background: #20332f;

            transform: translateY(-2px);

            box-shadow:
                0 10px 22px rgba(19, 33, 30, 0.16);
        }


        .reset-btn:active {
            transform: translateY(0);
        }


        /* =========================================
           BACK LOGIN
        ========================================= */

        .back-login {
            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 7px;

            margin-top: 21px;

            color: #617068;

            font-size: 11px;
            font-weight: 600;

            transition: color 0.2s ease;
        }


        .back-login:hover {
            color: var(--ink);
        }


        .back-login i {
            font-size: 10px;
        }


        /* =========================================
           MESSAGE
        ========================================= */

        .message {
            min-height: 18px;

            margin-top: 14px;

            color: var(--coral);

            font-size: 11px;

            text-align: center;
        }


        /* =========================================
           ANIMATION
        ========================================= */

        @keyframes pageIn {

            from {
                opacity: 0;

                transform: translateY(18px);
            }

            to {
                opacity: 1;

                transform: translateY(0);
            }

        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 850px) {

            .auth-container {
                grid-template-columns: 1fr;

                max-width: 600px;
            }


            .auth-left {
                padding: 42px;
            }


            .auth-left h1 {
                font-size: 39px;
            }


            .auth-card {
                padding: 45px;
            }

        }


        @media (max-width: 600px) {

            .auth-navbar {
                height: 68px;
            }


            .auth-nav-container {
                width: calc(100% - 30px);
            }


            .auth-brand-sub {
                display: none;
            }


            .auth-page {
                min-height: calc(100vh - 68px);

                padding: 25px 15px 40px;
            }


            .auth-container {
                border-radius: 18px;
            }


            .auth-left {
                padding: 35px 27px;
            }


            .auth-left h1 {
                font-size: 34px;

                letter-spacing: -1.5px;
            }


            .auth-left-description {
                font-size: 12px;
            }


            .auth-features {
                margin-top: 22px;
            }


            .auth-badge {
                margin-top: 23px;
            }


            .auth-card {
                padding: 35px 27px 40px;
            }


            .auth-card-header h2 {
                font-size: 25px;
            }

        }


        @media (max-width: 400px) {

            .auth-nav-btn {
                padding: 8px 11px;
            }


            .auth-nav-link {
                padding: 8px 9px;
            }


            .auth-left {
                padding: 30px 22px;
            }


            .auth-card {
                padding: 30px 22px 35px;
            }

        }

    </style>

</head>


<body>


<!-- =========================================
     NAVBAR
========================================= -->

<nav class="auth-navbar">

    <div class="auth-nav-container">


        <a
            href="${pageContext.request.contextPath}/home.jsp"
            class="auth-brand">


            <div class="auth-logo-icon">

                <i class="fa-solid fa-briefcase"></i>

            </div>


            <div>

                <span class="auth-brand-name">
                    SMARTHIRE
                </span>

                <span class="auth-brand-sub">
                    Recruitment Management Platform
                </span>

            </div>


        </a>


        <div class="auth-nav-links">


            <a
                href="${pageContext.request.contextPath}/login.jsp"
                class="auth-nav-link">

                Login

            </a>


            <a
                href="${pageContext.request.contextPath}/register.jsp"
                class="auth-nav-btn">

                Register

            </a>


        </div>


    </div>

</nav>


<!-- =========================================
     PAGE
========================================= -->

<div class="auth-page">


    <div class="auth-container">


        <!-- =================================
             LEFT PANEL
        ================================== -->

        <div class="auth-left">


            <div class="auth-left-content">


                <div class="reset-lock-icon">

                    <i class="fa-solid fa-lock"></i>

                </div>


                <h1>

                    Reset Your
                    <span>Password</span>

                </h1>


                <p class="auth-left-description">

                    Secure your SMARTHIRE account by creating
                    a new password. Enter your registered email
                    address and choose a strong password.

                </p>


                <div class="auth-features">


                    <div class="auth-feature">

                        <i class="fa-solid fa-shield-halved"></i>

                        Secure Process

                    </div>


                    <div class="auth-feature">

                        <i class="fa-solid fa-clock"></i>

                        Quick Reset

                    </div>


                    <div class="auth-feature">

                        <i class="fa-solid fa-user-shield"></i>

                        Account Protection

                    </div>


                </div>


                <div class="auth-badge">

                    <i
                        class="fa-solid fa-lock"
                        style="margin-right:6px;">
                    </i>

                    ACCOUNT SECURITY FIRST

                </div>


            </div>

        </div>


        <!-- =================================
             RESET FORM
        ================================== -->

        <div class="auth-card">


            <div class="auth-card-header">


                <div class="auth-card-icon">

                    <i class="fa-solid fa-key"></i>

                </div>


                <h2>
                    Reset Password
                </h2>


                <p class="subtitle">
                    Enter your details below
                </p>


            </div>


            <form
                action="${pageContext.request.contextPath}/reset"
                method="post"
                class="auth-form">


                <!-- EMAIL -->

                <div class="auth-input-group">


                    <label for="resetEmail">

                        <i class="fa-solid fa-envelope"></i>

                        Registered Email

                    </label>


                    <input
                        type="email"
                        id="resetEmail"
                        name="email"
                        placeholder="Enter your registered email"
                        autocomplete="email"
                        required>


                </div>


                <!-- PASSWORD -->

                <div class="auth-input-group">


                    <label for="resetPw">

                        <i class="fa-solid fa-lock"></i>

                        New Password

                    </label>


                    <div class="password-wrapper">


                        <input
                            type="password"
                            id="resetPw"
                            name="password"
                            placeholder="Enter your new password"
                            autocomplete="new-password"
                            required>


                        <button
                            type="button"
                            class="pw-toggle"
                            onclick="togglePw('resetPw', this)"
                            tabindex="-1"
                            aria-label="Show password">

                            <i class="fa-solid fa-eye"></i>

                        </button>


                    </div>


                </div>


                <!-- SUBMIT -->

                <input
                    type="submit"
                    value="Reset Password"
                    class="reset-btn">


            </form>


            <!-- BACK TO LOGIN -->

            <a
                href="${pageContext.request.contextPath}/login.jsp"
                class="back-login">

                <i class="fa-solid fa-arrow-left"></i>

                Back To Login

            </a>


            <!-- MESSAGE -->

            <p class="message">
                ${msg2}
            </p>


        </div>


    </div>

</div>


<!-- =========================================
     PASSWORD TOGGLE
========================================= -->

<script>

function togglePw(id, btn) {

    const input = document.getElementById(id);

    const icon = btn.querySelector("i");


    if (input.type === "password") {

        input.type = "text";

        icon.className = "fa-solid fa-eye-slash";

        btn.setAttribute("aria-label", "Hide password");

    } else {

        input.type = "password";

        icon.className = "fa-solid fa-eye";

        btn.setAttribute("aria-label", "Show password");

    }

}

</script>


</body>

</html>