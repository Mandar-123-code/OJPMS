<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <meta name="description"
          content="Login to SMARTHIRE - Access thousands of job opportunities">

    <title>Login | SMARTHIRE</title>

    <link rel="icon"
          href="${pageContext.request.contextPath}/favicon.svg"
          type="image/svg+xml">

    <!-- Google Fonts -->
    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@400;500;600;700&display=swap"
          rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


    <style>

        /* =====================================================
           SMARTHIRE LOGIN PAGE
        ===================================================== */

        :root {
            --ink: #13211e;
            --ink-soft: #24352f;

            --mint: #d9f67f;
            --mint-dark: #b9d95e;

            --coral: #f27961;

            --paper: #f4f1e8;
            --white: #ffffff;

            --line: #d6ddd1;

            --muted: #718079;
            --muted-dark: #52615a;

            --danger: #c94b45;
            --success: #4c8a58;
        }


        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }


        html {
            scroll-behavior: smooth;
        }


        body {
            min-height: 100vh;

            font-family: "DM Sans", sans-serif;

            color: var(--ink);

            background:
                radial-gradient(
                    circle at 10% 10%,
                    rgba(217, 246, 127, 0.18),
                    transparent 28%
                ),
                radial-gradient(
                    circle at 90% 90%,
                    rgba(242, 121, 97, 0.12),
                    transparent 30%
                ),
                #f0eee6;

            overflow-x: hidden;
        }


        a {
            text-decoration: none;
            color: inherit;
        }


        button,
        input {
            font-family: inherit;
        }


        /* =====================================================
           BACKGROUND DECORATION
        ===================================================== */

        .page-decoration {
            position: fixed;
            inset: 0;

            pointer-events: none;

            overflow: hidden;

            z-index: 0;
        }


        .decoration-circle {
            position: absolute;

            border-radius: 50%;

            filter: blur(1px);
        }


        .circle-one {
            width: 360px;
            height: 360px;

            top: -190px;
            left: -130px;

            background: rgba(217, 246, 127, 0.20);
        }


        .circle-two {
            width: 300px;
            height: 300px;

            right: -150px;
            bottom: -120px;

            background: rgba(242, 121, 97, 0.12);
        }


        .grid-pattern {
            position: absolute;

            inset: 0;

            opacity: 0.25;

            background-image:
                linear-gradient(
                    rgba(19, 33, 30, 0.035) 1px,
                    transparent 1px
                ),
                linear-gradient(
                    90deg,
                    rgba(19, 33, 30, 0.035) 1px,
                    transparent 1px
                );

            background-size: 42px 42px;
        }


        /* =====================================================
           NAVBAR
        ===================================================== */

        .login-navbar {
            position: relative;

            z-index: 10;

            height: 76px;

            background: rgba(244, 241, 232, 0.86);

            border-bottom: 1px solid rgba(214, 221, 209, 0.8);

            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
        }


        .login-nav-container {
            width: min(1240px, calc(100% - 48px));

            height: 100%;

            margin: auto;

            display: flex;

            align-items: center;

            justify-content: space-between;
        }


        /* =====================================================
           BRAND
        ===================================================== */

        .login-brand {
            display: flex;

            align-items: center;

            gap: 12px;
        }


        .login-logo {
            width: 42px;
            height: 42px;

            display: flex;

            align-items: center;
            justify-content: center;

            border-radius: 12px;

            background: var(--ink);

            color: var(--mint);

            font-size: 17px;

            box-shadow:
                0 8px 20px rgba(19, 33, 30, 0.15);
        }


        .login-brand-text {
            display: flex;

            flex-direction: column;

            line-height: 1;
        }


        .login-brand-name {
            font-family: "Space Grotesk", sans-serif;

            font-size: 19px;

            font-weight: 700;

            letter-spacing: -0.5px;
        }


        .login-brand-sub {
            margin-top: 5px;

            font-size: 9px;

            font-weight: 600;

            color: var(--muted);

            letter-spacing: 0.7px;

            text-transform: uppercase;
        }


        /* =====================================================
           NAV LINKS
        ===================================================== */

        .login-nav-links {
            display: flex;

            align-items: center;

            gap: 10px;
        }


        .login-home-link {
            display: inline-flex;

            align-items: center;

            gap: 7px;

            padding: 10px 14px;

            border-radius: 10px;

            color: var(--muted-dark);

            font-size: 13px;

            font-weight: 600;

            transition:
                background 0.2s ease,
                color 0.2s ease;
        }


        .login-home-link:hover {
            background: rgba(19, 33, 30, 0.06);

            color: var(--ink);
        }


        .login-create-btn {
            display: inline-flex;

            align-items: center;
            justify-content: center;

            padding: 11px 17px;

            border-radius: 10px;

            background: var(--ink);

            color: white;

            font-size: 12px;

            font-weight: 700;

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease;
        }


        .login-create-btn:hover {
            transform: translateY(-2px);

            box-shadow:
                0 9px 22px rgba(19, 33, 30, 0.18);
        }


        /* =====================================================
           MAIN
        ===================================================== */

        .login-main {
            position: relative;

            z-index: 2;

            min-height: calc(100vh - 76px);

            width: min(1180px, calc(100% - 48px));

            margin: auto;

            padding: 55px 0 70px;

            display: grid;

            grid-template-columns:
                minmax(0, 1fr)
                minmax(420px, 510px);

            align-items: center;

            gap: 70px;
        }


        /* =====================================================
           LEFT SIDE
        ===================================================== */

        .login-intro {
            max-width: 570px;

            animation: fadeLeft 0.7s ease both;
        }


        .intro-label {
            display: inline-flex;

            align-items: center;

            gap: 8px;

            padding: 7px 11px;

            border: 1px solid rgba(214, 221, 209, 0.95);

            background: rgba(255, 255, 255, 0.55);

            border-radius: 999px;

            font-size: 10px;

            font-weight: 800;

            letter-spacing: 1px;

            color: var(--muted-dark);

            margin-bottom: 22px;
        }


        .intro-label-dot {
            width: 7px;
            height: 7px;

            border-radius: 50%;

            background: var(--coral);

            box-shadow:
                0 0 0 4px rgba(242, 121, 97, 0.13);
        }


        .login-intro h1 {
            font-family: "Space Grotesk", sans-serif;

            font-size: clamp(42px, 5vw, 67px);

            line-height: 0.98;

            letter-spacing: -3px;

            max-width: 600px;

            margin-bottom: 24px;
        }


        .login-intro h1 span {
            display: inline-block;

            color: #617f35;

            position: relative;
        }


        .login-intro h1 span::after {
            content: "";

            position: absolute;

            left: 2px;
            right: 0;

            bottom: -4px;

            height: 7px;

            border-radius: 10px;

            background: var(--mint);

            z-index: -1;

            transform: rotate(-1.5deg);
        }


        .intro-description {
            max-width: 510px;

            color: var(--muted-dark);

            font-size: 15px;

            line-height: 1.75;

            margin-bottom: 30px;
        }


        /* =====================================================
           FEATURES
        ===================================================== */

        .intro-features {
            display: flex;

            flex-direction: column;

            gap: 13px;

            margin-bottom: 30px;
        }


        .intro-feature {
            display: flex;

            align-items: center;

            gap: 11px;

            font-size: 13px;

            font-weight: 600;

            color: var(--ink-soft);
        }


        .feature-icon {
            width: 27px;
            height: 27px;

            flex-shrink: 0;

            display: flex;

            align-items: center;
            justify-content: center;

            border-radius: 8px;

            background: rgba(217, 246, 127, 0.62);

            color: var(--ink);

            font-size: 11px;
        }


        /* =====================================================
           TRUST ROW
        ===================================================== */

        .intro-trust {
            display: flex;

            align-items: center;

            gap: 15px;

            padding-top: 8px;
        }


        .trust-avatars {
            display: flex;

            padding-left: 7px;
        }


        .trust-avatar {
            width: 30px;
            height: 30px;

            margin-left: -7px;

            border-radius: 50%;

            border: 2px solid var(--paper);

            display: flex;

            align-items: center;
            justify-content: center;

            font-size: 10px;

            font-weight: 800;

            background: var(--ink);

            color: var(--mint);
        }


        .trust-avatar:nth-child(2) {
            background: #65776f;

            color: white;
        }


        .trust-avatar:nth-child(3) {
            background: var(--coral);

            color: white;
        }


        .trust-avatar:nth-child(4) {
            background: #d2d9ca;

            color: var(--ink);
        }


        .trust-text {
            font-size: 11px;

            line-height: 1.45;

            color: var(--muted);
        }


        .trust-text strong {
            color: var(--ink);

            font-weight: 800;
        }


        /* =====================================================
           LOGIN CARD
        ===================================================== */

        .login-card {
            position: relative;

            background: rgba(255, 255, 255, 0.91);

            border: 1px solid rgba(214, 221, 209, 0.95);

            border-radius: 25px;

            padding: 38px;

            box-shadow:
                0 30px 80px rgba(19, 33, 30, 0.13),
                0 4px 14px rgba(19, 33, 30, 0.05);

            animation: fadeUp 0.7s 0.1s ease both;

            overflow: hidden;
        }


        .login-card::before {
            content: "";

            position: absolute;

            width: 180px;
            height: 180px;

            top: -100px;
            right: -80px;

            border-radius: 50%;

            background: rgba(217, 246, 127, 0.38);

            pointer-events: none;
        }


        .login-card-header {
            position: relative;

            z-index: 1;

            margin-bottom: 28px;
        }


        .card-icon {
            width: 47px;
            height: 47px;

            display: flex;

            align-items: center;
            justify-content: center;

            border-radius: 13px;

            background: var(--ink);

            color: var(--mint);

            font-size: 17px;

            margin-bottom: 18px;
        }


        .login-card-header h2 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 30px;

            letter-spacing: -1px;

            margin-bottom: 6px;
        }


        .card-subtitle {
            color: var(--muted);

            font-size: 13px;
        }


        /* =====================================================
           FORM
        ===================================================== */

        .login-form {
            position: relative;

            z-index: 1;

            display: flex;

            flex-direction: column;

            gap: 19px;
        }


        .input-group {
            display: flex;

            flex-direction: column;

            gap: 8px;
        }


        .input-group label {
            display: flex;

            align-items: center;

            gap: 7px;

            font-size: 11px;

            font-weight: 800;

            color: var(--ink-soft);
        }


        .input-group label i {
            color: #718079;

            font-size: 10px;
        }


        .input-control {
            width: 100%;

            height: 53px;

            border: 1px solid var(--line);

            border-radius: 11px;

            background: #fbfcfa;

            padding: 0 15px;

            outline: none;

            color: var(--ink);

            font-size: 13px;

            transition:
                border-color 0.2s ease,
                box-shadow 0.2s ease,
                background 0.2s ease;
        }


        .input-control::placeholder {
            color: #9aa39f;
        }


        .input-control:hover {
            border-color: #b9c4b8;
        }


        .input-control:focus {
            background: white;

            border-color: #8da26d;

            box-shadow:
                0 0 0 4px rgba(217, 246, 127, 0.25);
        }


        /* =====================================================
           PASSWORD
        ===================================================== */

        .password-wrapper {
            position: relative;
        }


        .password-wrapper .input-control {
            padding-right: 48px;
        }


        .pw-toggle {
            position: absolute;

            top: 50%;
            right: 6px;

            transform: translateY(-50%);

            width: 38px;
            height: 38px;

            border: none;

            background: transparent;

            color: #7d8983;

            border-radius: 8px;

            cursor: pointer;

            transition:
                background 0.2s ease,
                color 0.2s ease;
        }


        .pw-toggle:hover {
            background: #eef1eb;

            color: var(--ink);
        }


        /* =====================================================
           LOGIN BUTTON
        ===================================================== */

        .login-submit {
            position: relative;

            width: 100%;

            height: 54px;

            margin-top: 2px;

            border: none;

            border-radius: 11px;

            background: var(--ink);

            color: white;

            cursor: pointer;

            display: flex;

            align-items: center;
            justify-content: center;

            gap: 10px;

            font-family: "Space Grotesk", sans-serif;

            font-size: 13px;

            font-weight: 700;

            overflow: hidden;

            transition:
                transform 0.22s ease,
                box-shadow 0.22s ease,
                background 0.22s ease;
        }


        .login-submit::before {
            content: "";

            position: absolute;

            inset: 0;

            background:
                linear-gradient(
                    110deg,
                    transparent 25%,
                    rgba(255, 255, 255, 0.12) 50%,
                    transparent 75%
                );

            transform: translateX(-120%);

            transition: transform 0.65s ease;
        }


        .login-submit:hover {
            transform: translateY(-2px);

            background: #1b302a;

            box-shadow:
                0 13px 28px rgba(19, 33, 30, 0.20);
        }


        .login-submit:hover::before {
            transform: translateX(120%);
        }


        .login-submit i {
            color: var(--mint);

            transition: transform 0.22s ease;
        }


        .login-submit:hover i {
            transform: translateX(4px);
        }


        /* =====================================================
           FORGOT PASSWORD
        ===================================================== */

        .forgot-password {
            position: relative;

            z-index: 1;

            display: block;

            text-align: right;

            margin-top: 14px;

            font-size: 11px;

            font-weight: 700;

            color: #61754c;

            transition: color 0.2s ease;
        }


        .forgot-password:hover {
            color: var(--coral);
        }


        /* =====================================================
           MESSAGES
        ===================================================== */

        .message {
            position: relative;

            z-index: 1;

            padding: 10px 12px;

            margin-top: 15px;

            border-radius: 9px;

            font-size: 11px;

            font-weight: 600;

            line-height: 1.4;
        }


        .error-message {
            color: var(--danger);

            background: rgba(201, 75, 69, 0.08);

            border: 1px solid rgba(201, 75, 69, 0.16);
        }


        .success-message {
            color: var(--success);

            background: rgba(76, 138, 88, 0.08);

            border: 1px solid rgba(76, 138, 88, 0.16);
        }


        /* =====================================================
           REGISTER SWITCH
        ===================================================== */

        .register-switch {
            position: relative;

            z-index: 1;

            margin-top: 25px;

            padding-top: 20px;

            border-top: 1px solid #e3e7df;

            text-align: center;

            color: var(--muted);

            font-size: 12px;
        }


        .register-switch a {
            color: #5f7837;

            font-weight: 800;

            transition: color 0.2s ease;
        }


        .register-switch a:hover {
            color: var(--coral);
        }


        /* =====================================================
           SECURITY NOTE
        ===================================================== */

        .security-note {
            position: relative;

            z-index: 1;

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 7px;

            margin-top: 17px;

            color: #89938e;

            font-size: 9px;

            font-weight: 600;

            letter-spacing: 0.1px;
        }


        .security-note i {
            color: #6c8a45;

            font-size: 9px;
        }


        /* =====================================================
           ANIMATIONS
        ===================================================== */

        @keyframes fadeUp {
            from {
                opacity: 0;

                transform: translateY(18px);
            }

            to {
                opacity: 1;

                transform: translateY(0);
            }
        }


        @keyframes fadeLeft {
            from {
                opacity: 0;

                transform: translateX(-18px);
            }

            to {
                opacity: 1;

                transform: translateX(0);
            }
        }


        /* =====================================================
           TABLET
        ===================================================== */

        @media (max-width: 950px) {

            .login-main {
                grid-template-columns: 1fr;

                max-width: 560px;

                padding-top: 45px;

                gap: 40px;
            }


            .login-intro {
                text-align: center;

                max-width: none;
            }


            .intro-description {
                margin-left: auto;

                margin-right: auto;
            }


            .intro-features {
                align-items: center;
            }


            .intro-trust {
                justify-content: center;
            }


            .login-intro h1 {
                font-size: clamp(38px, 8vw, 56px);
            }
        }


        /* =====================================================
           MOBILE
        ===================================================== */

        @media (max-width: 600px) {

            .login-navbar {
                height: 68px;
            }


            .login-nav-container {
                width: calc(100% - 24px);
            }


            .login-brand-sub {
                display: none;
            }


            .login-brand-name {
                font-size: 17px;
            }


            .login-logo {
                width: 38px;
                height: 38px;

                border-radius: 10px;
            }


            .login-home-link {
                padding: 8px;

                font-size: 0;
            }


            .login-home-link i {
                font-size: 14px;
            }


            .login-create-btn {
                padding: 9px 11px;

                font-size: 10px;
            }


            .login-main {
                width: calc(100% - 24px);

                padding: 35px 0 45px;

                gap: 32px;
            }


            .login-intro h1 {
                font-size: 38px;

                letter-spacing: -2px;
            }


            .intro-description {
                font-size: 13px;
            }


            .login-card {
                padding: 25px 20px;

                border-radius: 20px;
            }


            .login-card-header h2 {
                font-size: 26px;
            }
        }


        /* =====================================================
           REDUCED MOTION
        ===================================================== */

        @media (prefers-reduced-motion: reduce) {

            *,
            *::before,
            *::after {
                animation-duration: 0.01ms !important;

                animation-iteration-count: 1 !important;

                scroll-behavior: auto !important;

                transition-duration: 0.01ms !important;
            }
        }

    </style>

</head>


<body>


<!-- =========================================================
     BACKGROUND
========================================================= -->

<div class="page-decoration">

    <div class="grid-pattern"></div>

    <div class="decoration-circle circle-one"></div>

    <div class="decoration-circle circle-two"></div>

</div>


<!-- =========================================================
     NAVBAR
========================================================= -->

<nav class="login-navbar">

    <div class="login-nav-container">

        <!-- BRAND -->

        <a href="${pageContext.request.contextPath}/home.jsp"
           class="login-brand">

            <div class="login-logo">
                <i class="fa-solid fa-briefcase"></i>
            </div>

            <div class="login-brand-text">

                <span class="login-brand-name">
                    SMARTHIRE
                </span>

                <span class="login-brand-sub">
                    Recruitment Management Platform
                </span>

            </div>

        </a>


        <!-- NAVIGATION -->

        <div class="login-nav-links">

            <a href="${pageContext.request.contextPath}/home.jsp"
               class="login-home-link">

                <i class="fa-solid fa-house"></i>

                <span>Home</span>

            </a>


            <a href="${pageContext.request.contextPath}/register.jsp"
               class="login-create-btn">

                Create Account

            </a>

        </div>

    </div>

</nav>


<!-- =========================================================
     MAIN CONTENT
========================================================= -->

<main class="login-main">


    <!-- =====================================================
         LEFT INTRO
    ====================================================== -->

    <section class="login-intro">

        <div class="intro-label">

            <span class="intro-label-dot"></span>

            YOUR NEXT CAREER MOVE STARTS HERE

        </div>


        <h1>

            Your Career

            <span>Opportunities</span>

            Start Here.

        </h1>


        <p class="intro-description">

            Sign in to continue your job search, explore new
            opportunities, manage applications and connect with
            recruiters through SMARTHIRE.

        </p>


        <!-- FEATURES -->

        <div class="intro-features">

            <div class="intro-feature">

                <span class="feature-icon">
                    <i class="fa-solid fa-briefcase"></i>
                </span>

                <span>
                    Explore 500+ active job opportunities
                </span>

            </div>


            <div class="intro-feature">

                <span class="feature-icon">
                    <i class="fa-solid fa-users"></i>
                </span>

                <span>
                    Connect with leading recruiters
                </span>

            </div>


            <div class="intro-feature">

                <span class="feature-icon">
                    <i class="fa-solid fa-bolt"></i>
                </span>

                <span>
                    Apply to opportunities in just a few steps
                </span>

            </div>

        </div>


        <!-- TRUST -->

        <div class="intro-trust">

            <div class="trust-avatars">

                <span class="trust-avatar">S</span>

                <span class="trust-avatar">I</span>

                <span class="trust-avatar">T</span>

                <span class="trust-avatar">+</span>

            </div>


            <p class="trust-text">

                <strong>Built for modern hiring.</strong>

                <br>

                Candidates and recruiters on one platform.

            </p>

        </div>

    </section>


    <!-- =====================================================
         LOGIN CARD
    ====================================================== -->

    <section class="login-card">


        <div class="login-card-header">

            <div class="card-icon">
                <i class="fa-solid fa-right-to-bracket"></i>
            </div>


            <h2>
                Welcome back
            </h2>


            <p class="card-subtitle">
                Sign in to your SMARTHIRE account
            </p>

        </div>


        <!-- LOGIN FORM -->

        <form action="${pageContext.request.contextPath}/login"
              method="post"
              class="login-form">


            <!-- EMAIL -->

            <div class="input-group">

                <label for="loginEmail">

                    <i class="fa-solid fa-envelope"></i>

                    Email Address

                </label>


                <input
                    type="email"
                    id="loginEmail"
                    name="email"
                    class="input-control"
                    placeholder="Enter your email address"
                    autocomplete="email"
                    required
                />

            </div>


            <!-- PASSWORD -->

            <div class="input-group">

                <label for="loginPassword">

                    <i class="fa-solid fa-lock"></i>

                    Password

                </label>


                <div class="password-wrapper">

                    <input
                        type="password"
                        id="loginPassword"
                        name="password"
                        class="input-control"
                        placeholder="Enter your password"
                        autocomplete="current-password"
                        required
                    />


                    <button
                        type="button"
                        class="pw-toggle"
                        onclick="togglePw('loginPassword', this)"
                        aria-label="Show password">

                        <i class="fa-solid fa-eye"></i>

                    </button>

                </div>

            </div>


            <!-- LOGIN BUTTON -->

            <button
                type="submit"
                class="login-submit">

                <span>
                    Login to SMARTHIRE
                </span>

                <i class="fa-solid fa-arrow-right"></i>

            </button>

        </form>


        <!-- FORGOT PASSWORD -->

        <a
            href="${pageContext.request.contextPath}/reset.jsp"
            class="forgot-password">

            Forgot Password?

        </a>


        <!-- ERROR -->

        <p class="message error-message">
            ${error}
        </p>


        <!-- SUCCESS -->

        <p class="message success-message">
            ${msg1}
        </p>


        <!-- REGISTER -->

        <div class="register-switch">

            Don't have an account?

            <a href="${pageContext.request.contextPath}/register.jsp">
                Create one
            </a>

        </div>


        <!-- SECURITY -->

        <div class="security-note">

            <i class="fa-solid fa-shield-halved"></i>

            Your login information is securely transmitted.

        </div>


    </section>

</main>


<!-- =========================================================
     JAVASCRIPT
========================================================= -->

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