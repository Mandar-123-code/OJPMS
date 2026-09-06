<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Post a Job | SMARTHIRE</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link
        href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@500;600;700&display=swap"
        rel="stylesheet">

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        :root {
            --ink: #13211e;
            --ink-soft: #263632;
            --mint: #d9f67f;
            --mint-dark: #bddc5d;
            --coral: #f27961;
            --paper: #f4f1e8;
            --white: #ffffff;
            --line: #d6ddd1;
            --muted: #6d7974;
            --sidebar: #111d1a;
            --shadow: 0 18px 50px rgba(19, 33, 30, 0.08);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: "DM Sans", sans-serif;
            background: var(--paper);
            color: var(--ink);
            min-height: 100vh;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        button,
        input,
        textarea {
            font-family: inherit;
        }

        /* =========================
           SIDEBAR
        ========================= */

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 250px;
            height: 100vh;
            background: var(--sidebar);
            color: #fff;
            padding: 26px 18px;
            z-index: 1000;
            display: flex;
            flex-direction: column;
        }

        .sidebar-logo {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 5px 8px 28px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.09);
        }

        .sidebar-logo-icon {
            width: 42px;
            height: 42px;
            border-radius: 12px;
            background: var(--mint);
            color: var(--ink);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            flex-shrink: 0;
        }

        .sidebar-logo-text h2 {
            font-family: "Space Grotesk", sans-serif;
            font-size: 17px;
            letter-spacing: 1.2px;
        }

        .sidebar-logo-text span {
            display: block;
            color: #94a19c;
            font-size: 11px;
            margin-top: 2px;
        }

        .sidebar-nav {
            padding-top: 26px;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .sidebar-nav a {
            display: flex;
            align-items: center;
            gap: 13px;
            padding: 13px 14px;
            border-radius: 11px;
            color: #aeb8b4;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.25s ease;
        }

        .sidebar-nav a i {
            width: 18px;
            text-align: center;
            font-size: 14px;
        }

        .sidebar-nav a:hover {
            background: rgba(255, 255, 255, 0.06);
            color: #fff;
            transform: translateX(3px);
        }

        .sidebar-nav a.active {
            background: var(--mint);
            color: var(--ink);
            font-weight: 700;
        }

        .sidebar-nav a.active:hover {
            transform: none;
        }

        .nav-divider {
            height: 1px;
            background: rgba(255, 255, 255, 0.09);
            margin: 18px 8px;
        }

        .sidebar-nav .logout-link {
            color: #f08b78;
        }

        .sidebar-nav .logout-link:hover {
            background: rgba(242, 121, 97, 0.08);
            color: #ff9d8b;
        }

        /* =========================
           MAIN
        ========================= */

        .main-content {
            margin-left: 250px;
            min-height: 100vh;
            padding: 0 42px 60px;
        }

        /* =========================
           TOPBAR
        ========================= */

        .topbar {
            height: 82px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid var(--line);
            margin-bottom: 32px;
        }

        .eyebrow {
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.8px;
            color: var(--coral);
            margin-bottom: 5px;
        }

        .topbar h1 {
            font-family: "Space Grotesk", sans-serif;
            font-size: 25px;
            line-height: 1.1;
        }

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .top-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 15px;
            border: 1px solid var(--line);
            border-radius: 10px;
            background: var(--white);
            font-size: 13px;
            font-weight: 600;
            transition: all 0.25s ease;
        }

        .top-btn:hover {
            border-color: var(--ink);
            transform: translateY(-2px);
            box-shadow: 0 7px 18px rgba(19, 33, 30, 0.08);
        }

        /* =========================
           INTRO
        ========================= */

        .page-intro {
            display: grid;
            grid-template-columns: 1fr auto;
            gap: 30px;
            align-items: end;
            margin-bottom: 28px;
        }

        .page-intro h2 {
            font-family: "Space Grotesk", sans-serif;
            font-size: clamp(30px, 4vw, 46px);
            line-height: 1.02;
            letter-spacing: -1.5px;
            max-width: 650px;
        }

        .page-intro h2 span {
            color: var(--coral);
        }

        .page-intro p {
            max-width: 650px;
            color: var(--muted);
            margin-top: 13px;
            line-height: 1.7;
            font-size: 14px;
        }

        .draft-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 9px 13px;
            background: #fff;
            border: 1px solid var(--line);
            border-radius: 100px;
            font-size: 12px;
            font-weight: 600;
            white-space: nowrap;
        }

        .draft-dot {
            width: 7px;
            height: 7px;
            border-radius: 50%;
            background: var(--mint-dark);
        }

        /* =========================
           STATS
        ========================= */

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
            margin-bottom: 28px;
        }

        .stat-card {
            background: var(--white);
            border: 1px solid var(--line);
            border-radius: 16px;
            padding: 19px 21px;
            display: flex;
            align-items: center;
            gap: 15px;
            box-shadow: 0 8px 25px rgba(19, 33, 30, 0.035);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow);
        }

        .stat-icon {
            width: 44px;
            height: 44px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eef5dd;
            color: var(--ink);
        }

        .stat-number {
            font-family: "Space Grotesk", sans-serif;
            font-size: 21px;
            font-weight: 700;
        }

        .stat-label {
            font-size: 12px;
            color: var(--muted);
            margin-top: 2px;
        }

        /* =========================
           FORM LAYOUT
        ========================= */

        .post-layout {
            display: grid;
            grid-template-columns: 0.78fr 1.35fr;
            gap: 22px;
            align-items: stretch;
        }

        /* =========================
           INFO CARD
        ========================= */

        .info-card {
            position: relative;
            overflow: hidden;
            background: var(--ink);
            color: white;
            border-radius: 20px;
            padding: 34px;
            min-height: 610px;
            display: flex;
            flex-direction: column;
        }

        .info-card::before {
            content: "";
            position: absolute;
            width: 250px;
            height: 250px;
            border-radius: 50%;
            background: rgba(217, 246, 127, 0.08);
            right: -100px;
            top: -80px;
        }

        .info-card::after {
            content: "";
            position: absolute;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            border: 1px solid rgba(217, 246, 127, 0.13);
            right: -50px;
            bottom: -60px;
        }

        .info-tag {
            position: relative;
            z-index: 1;
            width: fit-content;
            padding: 7px 10px;
            border-radius: 100px;
            background: rgba(217, 246, 127, 0.12);
            color: var(--mint);
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.2px;
            margin-bottom: 22px;
        }

        .info-card h3 {
            position: relative;
            z-index: 1;
            font-family: "Space Grotesk", sans-serif;
            font-size: 31px;
            line-height: 1.1;
            max-width: 330px;
        }

        .info-card h3 span {
            color: var(--mint);
        }

        .info-card > p {
            position: relative;
            z-index: 1;
            color: #aebbb6;
            font-size: 14px;
            line-height: 1.75;
            margin-top: 15px;
            max-width: 380px;
        }

        .benefits {
            position: relative;
            z-index: 1;
            margin-top: 30px;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .benefit {
            display: flex;
            align-items: flex-start;
            gap: 12px;
        }

        .benefit-icon {
            width: 29px;
            height: 29px;
            border-radius: 8px;
            background: rgba(217, 246, 127, 0.11);
            color: var(--mint);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            font-size: 11px;
        }

        .benefit strong {
            display: block;
            font-size: 13px;
            margin-bottom: 2px;
        }

        .benefit span {
            display: block;
            color: #8f9e98;
            font-size: 11px;
            line-height: 1.5;
        }

        .info-bottom {
            position: relative;
            z-index: 1;
            margin-top: auto;
            padding-top: 28px;
        }

        .info-bottom-card {
            border: 1px solid rgba(255, 255, 255, 0.09);
            background: rgba(255, 255, 255, 0.035);
            border-radius: 13px;
            padding: 15px;
            display: flex;
            gap: 11px;
            align-items: flex-start;
        }

        .info-bottom-card i {
            color: var(--mint);
            margin-top: 2px;
        }

        .info-bottom-card p {
            color: #9aa8a3;
            font-size: 11px;
            line-height: 1.55;
        }

        /* =========================
           FORM CARD
        ========================= */

        .form-card {
            background: var(--white);
            border: 1px solid var(--line);
            border-radius: 20px;
            padding: 34px;
            box-shadow: var(--shadow);
        }

        .form-heading {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            gap: 15px;
            margin-bottom: 27px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--line);
        }

        .form-heading-left {
            display: flex;
            align-items: center;
            gap: 13px;
        }

        .heading-icon {
            width: 43px;
            height: 43px;
            border-radius: 11px;
            background: var(--ink);
            color: var(--mint);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-heading h3 {
            font-family: "Space Grotesk", sans-serif;
            font-size: 20px;
        }

        .form-heading p {
            color: var(--muted);
            font-size: 11px;
            margin-top: 3px;
        }

        .required-note {
            color: var(--muted);
            font-size: 11px;
            padding-top: 5px;
        }

        .required-note span {
            color: var(--coral);
        }

        /* =========================
           FORM FIELDS
        ========================= */

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 12px;
            font-weight: 700;
            margin-bottom: 8px;
            color: var(--ink);
        }

        .label-hint {
            color: var(--muted);
            font-weight: 400;
            margin-left: 4px;
        }

        .input-wrap {
            position: relative;
        }

        .input-wrap > i {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #8b9691;
            font-size: 13px;
            pointer-events: none;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            border: 1px solid var(--line);
            background: #fbfcf9;
            border-radius: 11px;
            padding: 13px 14px;
            outline: none;
            color: var(--ink);
            font-size: 13px;
            transition: border 0.2s ease, box-shadow 0.2s ease,
                        background 0.2s ease;
        }

        .input-wrap input {
            padding-left: 41px;
        }

        .form-group textarea {
            min-height: 155px;
            resize: vertical;
            line-height: 1.65;
        }

        .form-group input::placeholder,
        .form-group textarea::placeholder {
            color: #a2aaa6;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            background: #fff;
            border-color: var(--ink);
            box-shadow: 0 0 0 3px rgba(217, 246, 127, 0.32);
        }

        .form-group input:valid:not(:placeholder-shown),
        .form-group textarea:valid:not(:placeholder-shown) {
            border-color: #cbd6bd;
        }

        .two-col {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .field-note {
            margin-top: 7px;
            color: var(--muted);
            font-size: 10px;
        }

        /* =========================
           DESCRIPTION COUNTER
        ========================= */

        .textarea-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }

        .textarea-header label {
            margin-bottom: 0;
        }

        .char-count {
            color: #8b9691;
            font-size: 10px;
        }

        /* =========================
           SUBMIT AREA
        ========================= */

        .submit-area {
            border-top: 1px solid var(--line);
            margin-top: 8px;
            padding-top: 21px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 18px;
        }

        .submit-note {
            display: flex;
            align-items: flex-start;
            gap: 9px;
            color: var(--muted);
            font-size: 10px;
            line-height: 1.45;
            max-width: 250px;
        }

        .submit-note i {
            color: #71952d;
            margin-top: 1px;
        }

        .submit-btn {
            border: 0;
            background: var(--ink);
            color: #fff;
            border-radius: 11px;
            padding: 14px 21px;
            min-width: 145px;
            cursor: pointer;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.4px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 9px;
            transition: all 0.25s ease;
        }

        .submit-btn:hover {
            background: #1d302b;
            transform: translateY(-2px);
            box-shadow: 0 12px 25px rgba(19, 33, 30, 0.18);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        /* =========================
           ANIMATIONS
        ========================= */

        .fade-up {
            animation: fadeUp 0.65s ease both;
        }

        .delay-1 {
            animation-delay: 0.08s;
        }

        .delay-2 {
            animation-delay: 0.16s;
        }

        .delay-3 {
            animation-delay: 0.24s;
        }

        @keyframes fadeUp {
            from {
                opacity: 0;
                transform: translateY(14px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 1100px) {
            .main-content {
                padding-left: 28px;
                padding-right: 28px;
            }

            .post-layout {
                grid-template-columns: 1fr;
            }

            .info-card {
                min-height: auto;
            }

            .info-bottom {
                margin-top: 28px;
            }
        }

        @media (max-width: 760px) {
            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
                padding: 16px;
            }

            .sidebar-logo {
                padding-bottom: 16px;
            }

            .sidebar-nav {
                padding-top: 15px;
                display: grid;
                grid-template-columns: 1fr 1fr;
            }

            .nav-divider {
                display: none;
            }

            .main-content {
                margin-left: 0;
                padding: 0 16px 40px;
            }

            .topbar {
                height: auto;
                padding: 18px 0;
                gap: 15px;
                align-items: flex-start;
            }

            .topbar-right {
                display: none;
            }

            .page-intro {
                grid-template-columns: 1fr;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .form-card,
            .info-card {
                padding: 24px;
            }
        }

        @media (max-width: 520px) {
            .two-col {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .submit-area {
                flex-direction: column;
                align-items: stretch;
            }

            .submit-note {
                max-width: none;
            }

            .submit-btn {
                width: 100%;
            }

            .sidebar-nav {
                grid-template-columns: 1fr;
            }

            .page-intro h2 {
                font-size: 32px;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            html {
                scroll-behavior: auto;
            }

            *,
            *::before,
            *::after {
                animation-duration: 0.01ms !important;
                transition-duration: 0.01ms !important;
            }
        }
    </style>
</head>

<body>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!-- =========================
     SIDEBAR
========================= -->

<aside class="sidebar">

    <div class="sidebar-logo">
        <div class="sidebar-logo-icon">
            <i class="fa-solid fa-briefcase"></i>
        </div>

        <div class="sidebar-logo-text">
            <h2>SMARTHIRE</h2>
            <span>Recruiter Portal</span>
        </div>
    </div>

    <nav class="sidebar-nav">

        <a href="${pageContext.request.contextPath}/recruiter-dashboard.jsp">
            <i class="fa-solid fa-gauge"></i>
            <span>Dashboard</span>
        </a>

        <a href="${pageContext.request.contextPath}/post-job.jsp"
           class="active">
            <i class="fa-solid fa-plus"></i>
            <span>Post Job</span>
        </a>

        <a href="${pageContext.request.contextPath}/postedjobs">
            <i class="fa-solid fa-list-ul"></i>
            <span>Posted Jobs</span>
        </a>

        <a href="${pageContext.request.contextPath}/home.jsp">
            <i class="fa-solid fa-house"></i>
            <span>Home</span>
        </a>

        <div class="nav-divider"></div>

        <a href="${pageContext.request.contextPath}/logout"
           class="logout-link">
            <i class="fa-solid fa-right-from-bracket"></i>
            <span>Logout</span>
        </a>

    </nav>

</aside>


<!-- =========================
     MAIN CONTENT
========================= -->

<main class="main-content">

    <!-- TOPBAR -->

    <header class="topbar fade-up">

        <div>
            <div class="eyebrow">Recruiter Workspace</div>
            <h1>Create Job Listing</h1>
        </div>

        <div class="topbar-right">

            <a href="${pageContext.request.contextPath}/recruiter-dashboard.jsp"
               class="top-btn">
                <i class="fa-solid fa-arrow-left"></i>
                Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/logout"
               class="top-btn">
                <i class="fa-solid fa-right-from-bracket"></i>
                Logout
            </a>

        </div>

    </header>


    <!-- INTRO -->

    <section class="page-intro fade-up delay-1">

        <div>
            <h2>
                Find the right talent.
                <span>Start with the right job post.</span>
            </h2>

            <p>
                Create a clear and compelling opportunity to reach relevant
                candidates, attract stronger applications, and build your
                hiring pipeline faster.
            </p>
        </div>

        <div class="draft-badge">
            <span class="draft-dot"></span>
            New listing
        </div>

    </section>


    <!-- STATS -->

    <section class="stats-grid fade-up delay-2">

        <div class="stat-card">

            <div class="stat-icon">
                <i class="fa-solid fa-users"></i>
            </div>

            <div>
                <div class="stat-number">500+</div>
                <div class="stat-label">Active Candidates</div>
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                <i class="fa-solid fa-briefcase"></i>
            </div>

            <div>
                <div class="stat-number">120+</div>
                <div class="stat-label">Jobs Posted</div>
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                <i class="fa-solid fa-chart-line"></i>
            </div>

            <div>
                <div class="stat-number">95%</div>
                <div class="stat-label">Hiring Success</div>
            </div>

        </div>

    </section>


    <!-- POST JOB AREA -->

    <section class="post-layout fade-up delay-3">


        <!-- LEFT INFO PANEL -->

        <div class="info-card">

            <div class="info-tag">
                <i class="fa-solid fa-sparkles"></i>
                Recruit smarter
            </div>

            <h3>
                Your next great hire could be
                <span>one post away.</span>
            </h3>

            <p>
                Give candidates the information they need to understand the
                opportunity and decide if your role is the right fit.
            </p>


            <div class="benefits">

                <div class="benefit">

                    <div class="benefit-icon">
                        <i class="fa-solid fa-bullseye"></i>
                    </div>

                    <div>
                        <strong>Reach relevant talent</strong>
                        <span>
                            Put your opportunity in front of active
                            job seekers.
                        </span>
                    </div>

                </div>


                <div class="benefit">

                    <div class="benefit-icon">
                        <i class="fa-solid fa-bolt"></i>
                    </div>

                    <div>
                        <strong>Start receiving applications</strong>
                        <span>
                            Candidates can discover and apply to your
                            listing.
                        </span>
                    </div>

                </div>


                <div class="benefit">

                    <div class="benefit-icon">
                        <i class="fa-solid fa-users"></i>
                    </div>

                    <div>
                        <strong>Manage candidates easily</strong>
                        <span>
                            Review applicants and move them through your
                            hiring process.
                        </span>
                    </div>

                </div>


                <div class="benefit">

                    <div class="benefit-icon">
                        <i class="fa-solid fa-calendar-check"></i>
                    </div>

                    <div>
                        <strong>Move faster</strong>
                        <span>
                            Shortlist candidates and schedule interviews
                            directly.
                        </span>
                    </div>

                </div>

            </div>


            <div class="info-bottom">

                <div class="info-bottom-card">

                    <i class="fa-solid fa-circle-info"></i>

                    <p>
                        Tip: Clear job titles, realistic salary information
                        and specific responsibilities generally make a
                        listing easier for candidates to understand.
                    </p>

                </div>

            </div>

        </div>


        <!-- RIGHT FORM -->

        <div class="form-card">

            <div class="form-heading">

                <div class="form-heading-left">

                    <div class="heading-icon">
                        <i class="fa-solid fa-pen-to-square"></i>
                    </div>

                    <div>
                        <h3>Job Details</h3>
                        <p>Tell candidates about the opportunity.</p>
                    </div>

                </div>

                <div class="required-note">
                    <span>*</span> Required
                </div>

            </div>


            <form action="${pageContext.request.contextPath}/postjob"
                  method="post">


                <!-- JOB TITLE -->

                <div class="form-group">

                    <label for="pjTitle">
                        Job Title
                    </label>

                    <div class="input-wrap">

                        <i class="fa-solid fa-briefcase"></i>

                        <input
                            type="text"
                            id="pjTitle"
                            name="title"
                            placeholder="e.g. Senior Java Developer"
                            maxlength="100"
                            required>

                    </div>

                    <div class="field-note">
                        Use a specific and easy-to-understand title.
                    </div>

                </div>


                <!-- LOCATION -->

                <div class="form-group">

                    <label for="pjLocation">
                        Location
                    </label>

                    <div class="input-wrap">

                        <i class="fa-solid fa-location-dot"></i>

                        <input
                            type="text"
                            id="pjLocation"
                            name="location"
                            placeholder="e.g. Pune, Maharashtra"
                            maxlength="100"
                            required>

                    </div>

                </div>


                <!-- SALARY + DATE -->

                <div class="two-col">

                    <div class="form-group">

                        <label for="pjSalary">
                            Salary
                            <span class="label-hint">
                                (₹ per annum)
                            </span>
                        </label>

                        <div class="input-wrap">

                            <i class="fa-solid fa-indian-rupee-sign"></i>

                            <input
                                type="number"
                                id="pjSalary"
                                name="salary"
                                placeholder="e.g. 800000"
                                min="0"
                                step="0.01"
                                required>

                        </div>

                        <div class="field-note">
                            Enter the annual salary amount.
                        </div>

                    </div>


                    <div class="form-group">

                        <label for="pjLastDate">
                            Last Date to Apply
                        </label>

                        <div class="input-wrap">

                            <i class="fa-regular fa-calendar"></i>

                            <input
                                type="date"
                                id="pjLastDate"
                                name="lastDate"
                                required>

                        </div>

                    </div>

                </div>


                <!-- DESCRIPTION -->

                <div class="form-group">

                    <div class="textarea-header">

                        <label for="pjDesc">
                            Job Description
                        </label>

                        <span class="char-count" id="charCount">
                            0 characters
                        </span>

                    </div>

                    <textarea
                        id="pjDesc"
                        name="description"
                        rows="7"
                        maxlength="3000"
                        placeholder="Describe the role, responsibilities, required skills, experience and what the candidate can expect..."
                        required></textarea>

                    <div class="field-note">
                        Include responsibilities, required skills,
                        experience and other important details.
                    </div>

                </div>


                <!-- SUBMIT -->

                <div class="submit-area">

                    <div class="submit-note">

                        <i class="fa-solid fa-shield-halved"></i>

                        <span>
                            Review your details before publishing.
                            Required fields must be completed.
                        </span>

                    </div>

                    <button type="submit" class="submit-btn">

                        <i class="fa-solid fa-paper-plane"></i>

                        Post Job

                    </button>

                </div>

            </form>

        </div>

    </section>

</main>


<script>

    /* =========================
       DESCRIPTION CHARACTER COUNT
    ========================= */

    const description = document.getElementById("pjDesc");
    const charCount = document.getElementById("charCount");

    if (description && charCount) {

        function updateCharacterCount() {

            const count = description.value.length;

            charCount.textContent =
                count + (count === 1 ? " character" : " characters");

        }

        description.addEventListener("input", updateCharacterCount);

        updateCharacterCount();
    }


    /* =========================
       SET MINIMUM APPLICATION DATE
    ========================= */

    const lastDate = document.getElementById("pjLastDate");

    if (lastDate) {

        const today = new Date();

        const year = today.getFullYear();
        const month = String(today.getMonth() + 1).padStart(2, "0");
        const day = String(today.getDate()).padStart(2, "0");

        lastDate.min = `${year}-${month}-${day}`;
    }

</script>

</body>
</html>