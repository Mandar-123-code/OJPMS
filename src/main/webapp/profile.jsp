<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Profile | SMARTHIRE</title>

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
            --mint: #d9f67f;
            --coral: #f27961;
            --paper: #f4f1e8;
            --white: #ffffff;
            --line: #d6ddd1;
            --muted: #6d7974;
            --sidebar: #111d1a;
            --green: #5f8523;
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
        input {
            font-family: inherit;
        }


        /* =========================================
           SIDEBAR
        ========================================= */

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

        .logout-link {
            color: #f08b78 !important;
        }

        .logout-link:hover {
            background: rgba(242, 121, 97, 0.08) !important;
            color: #ff9d8b !important;
        }


        /* =========================================
           MAIN
        ========================================= */

        .main-content {
            margin-left: 250px;
            min-height: 100vh;
            padding: 0 42px 60px;
        }


        /* =========================================
           TOPBAR
        ========================================= */

        .topbar {
            min-height: 82px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            border-bottom: 1px solid var(--line);
            margin-bottom: 30px;
        }

        .eyebrow {
            color: var(--coral);
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.8px;
            margin-bottom: 5px;
        }

        .topbar h1 {
            font-family: "Space Grotesk", sans-serif;
            font-size: 25px;
            line-height: 1.1;
        }

        .topbar-right {
            display: flex;
            gap: 9px;
        }


        /* =========================================
           BUTTONS
        ========================================= */

        .btn {
            border: 0;
            border-radius: 10px;
            padding: 11px 15px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.25s ease;
        }

        .btn-sm {
            padding: 9px 13px;
            font-size: 11px;
        }

        .btn-primary {
            background: var(--ink);
            color: #fff;
        }

        .btn-primary:hover {
            background: #22342f;
            transform: translateY(-2px);
            box-shadow: 0 9px 22px rgba(19, 33, 30, 0.15);
        }

        .btn-secondary {
            background: var(--white);
            color: var(--ink);
            border: 1px solid var(--line);
        }

        .btn-secondary:hover {
            border-color: var(--ink);
            transform: translateY(-2px);
        }


        /* =========================================
           PROFILE COVER
        ========================================= */

        .profile-cover {
            height: 185px;
            position: relative;
            overflow: hidden;
            background: var(--ink);
            border-radius: 20px 20px 0 0;
        }

        .profile-cover::before {
            content: "";
            position: absolute;
            width: 330px;
            height: 330px;
            border-radius: 50%;
            border: 1px solid rgba(217, 246, 127, 0.13);
            right: 7%;
            top: -210px;
        }

        .profile-cover::after {
            content: "";
            position: absolute;
            width: 210px;
            height: 210px;
            border-radius: 50%;
            background: rgba(217, 246, 127, 0.07);
            right: -60px;
            bottom: -130px;
        }

        .cover-content {
            position: absolute;
            left: 30px;
            top: 27px;
            z-index: 2;
        }

        .cover-label {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 7px 10px;
            border-radius: 100px;
            background: rgba(217, 246, 127, 0.1);
            color: var(--mint);
            font-size: 9px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.3px;
        }

        .cover-content h2 {
            color: #fff;
            font-family: "Space Grotesk", sans-serif;
            font-size: 25px;
            margin-top: 16px;
        }

        .cover-content p {
            color: #9eaaa5;
            font-size: 12px;
            margin-top: 5px;
        }


        /* =========================================
           PROFILE HEADER
        ========================================= */

        .profile-header {
            position: relative;
            margin-top: -1px;
            background: var(--white);
            border: 1px solid var(--line);
            border-top: 0;
            border-radius: 0 0 20px 20px;
            padding: 0 30px 28px;
        }

        .profile-header-inner {
            display: flex;
            align-items: flex-end;
            gap: 20px;
        }

        .avatar {
            width: 104px;
            height: 104px;
            border-radius: 25px;
            background: var(--mint);
            color: var(--ink);
            border: 6px solid var(--white);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: "Space Grotesk", sans-serif;
            font-size: 38px;
            font-weight: 700;
            margin-top: -52px;
            flex-shrink: 0;
            box-shadow: 0 10px 28px rgba(19, 33, 30, 0.12);
        }

        .profile-info {
            padding-top: 18px;
            flex: 1;
            min-width: 0;
        }

        .profile-name-row {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
        }

        .profile-info h2 {
            font-family: "Space Grotesk", sans-serif;
            font-size: 27px;
            letter-spacing: -0.5px;
        }

        .role-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 10px;
            background: #eef4df;
            color: #597822;
            border-radius: 100px;
            font-size: 9px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.6px;
        }

        .profile-contact {
            display: flex;
            flex-wrap: wrap;
            gap: 17px;
            margin-top: 9px;
        }

        .contact-item {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            color: var(--muted);
            font-size: 11px;
        }

        .contact-item i {
            color: var(--coral);
            font-size: 11px;
        }

        .profile-actions {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-top: 17px;
        }

        .success-message {
            color: var(--green);
            font-size: 11px;
            font-weight: 600;
        }


        /* =========================================
           STATS
        ========================================= */

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin-top: 20px;
        }

        .stat-card {
            background: var(--white);
            border: 1px solid var(--line);
            border-radius: 15px;
            padding: 19px;
            transition: all 0.25s ease;
        }

        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow);
        }

        .stat-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .stat-icon {
            width: 38px;
            height: 38px;
            border-radius: 10px;
            background: #edf3e3;
            color: var(--ink);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 13px;
        }

        .stat-number {
            font-family: "Space Grotesk", sans-serif;
            font-size: 24px;
            font-weight: 700;
            margin-top: 13px;
        }

        .stat-label {
            color: var(--muted);
            font-size: 11px;
            margin-top: 2px;
        }


        /* =========================================
           CONTENT GRID
        ========================================= */

        .content-grid {
            display: grid;
            grid-template-columns: 1.35fr 0.85fr;
            gap: 18px;
            margin-top: 18px;
        }

        .section-card {
            background: var(--white);
            border: 1px solid var(--line);
            border-radius: 17px;
            padding: 25px;
            box-shadow: 0 6px 22px rgba(19, 33, 30, 0.025);
        }

        .section-card.full-width {
            grid-column: 1 / -1;
        }

        .section-heading {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 15px;
        }

        .section-heading-icon {
            width: 34px;
            height: 34px;
            border-radius: 9px;
            background: #f0f4ec;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--ink);
            font-size: 12px;
        }

        .section-heading h3 {
            font-family: "Space Grotesk", sans-serif;
            font-size: 17px;
        }

        .about-text {
            color: var(--muted);
            font-size: 13px;
            line-height: 1.75;
        }


        /* =========================================
           SKILLS
        ========================================= */

        .skills {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .skill-chip {
            padding: 8px 11px;
            border-radius: 9px;
            background: #f5f7f3;
            border: 1px solid #e2e8df;
            color: #44514c;
            font-size: 11px;
            font-weight: 600;
            transition: all 0.2s ease;
        }

        .skill-chip:hover {
            background: var(--mint);
            border-color: var(--mint);
            color: var(--ink);
            transform: translateY(-2px);
        }


        /* =========================================
           PROFILE COMPLETION
        ========================================= */

        .completion-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 11px;
        }

        .completion-header span:first-child {
            font-size: 12px;
            color: var(--muted);
        }

        .completion-percent {
            font-family: "Space Grotesk", sans-serif;
            font-size: 16px;
            font-weight: 700;
        }

        .progress-track {
            height: 9px;
            width: 100%;
            background: #e8ece5;
            border-radius: 100px;
            overflow: hidden;
        }

        .progress-fill {
            width: 80%;
            height: 100%;
            background: var(--mint);
            border-radius: inherit;
            position: relative;
        }

        .progress-fill::after {
            content: "";
            position: absolute;
            right: 0;
            top: 0;
            width: 12px;
            height: 100%;
            background: rgba(19, 33, 30, 0.12);
        }

        .completion-note {
            color: var(--muted);
            font-size: 10px;
            line-height: 1.5;
            margin-top: 10px;
        }


        /* =========================================
           ACCOUNT DETAILS
        ========================================= */

        .details-list {
            display: flex;
            flex-direction: column;
        }

        .detail-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            padding: 12px 0;
            border-bottom: 1px solid #edf0eb;
        }

        .detail-row:last-child {
            border-bottom: 0;
            padding-bottom: 0;
        }

        .detail-label {
            color: var(--muted);
            font-size: 11px;
        }

        .detail-value {
            font-size: 11px;
            font-weight: 700;
            text-align: right;
        }

        .active-status {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: var(--green);
        }

        .active-status::before {
            content: "";
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: #7da32f;
        }


        /* =========================================
           QUICK ACTION
        ========================================= */

        .quick-action {
            margin-top: 18px;
            background: var(--ink);
            color: #fff;
            border-radius: 17px;
            padding: 22px 25px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
        }

        .quick-action h3 {
            font-family: "Space Grotesk", sans-serif;
            font-size: 17px;
        }

        .quick-action p {
            color: #9ba8a3;
            font-size: 11px;
            margin-top: 4px;
        }

        .quick-action .btn {
            background: var(--mint);
            color: var(--ink);
            flex-shrink: 0;
        }

        .quick-action .btn:hover {
            background: #e5ff92;
        }


        /* =========================================
           ANIMATION
        ========================================= */

        .fade-up {
            animation: fadeUp 0.55s ease both;
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
                transform: translateY(12px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }

        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 1050px) {

            .main-content {
                padding-left: 28px;
                padding-right: 28px;
            }

            .content-grid {
                grid-template-columns: 1fr;
            }

            .section-card.full-width {
                grid-column: auto;
            }

        }

        @media (max-width: 800px) {

            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
                padding: 16px;
            }

            .main-content {
                margin-left: 0;
                padding: 0 16px 45px;
            }

            .sidebar-nav {
                display: grid;
                grid-template-columns: 1fr 1fr;
                padding-top: 15px;
            }

            .nav-divider {
                display: none;
            }

            .topbar {
                min-height: auto;
                padding: 18px 0;
            }

            .topbar-right {
                display: none;
            }

            .stats-grid {
                grid-template-columns: 1fr 1fr;
            }

        }

        @media (max-width: 600px) {

            .profile-cover {
                height: 155px;
            }

            .profile-header {
                padding: 0 20px 23px;
            }

            .profile-header-inner {
                align-items: flex-start;
                flex-direction: column;
                gap: 8px;
            }

            .avatar {
                margin-top: -45px;
                width: 90px;
                height: 90px;
                font-size: 32px;
            }

            .profile-info {
                padding-top: 5px;
            }

            .profile-info h2 {
                font-size: 23px;
            }

            .stats-grid {
                grid-template-columns: 1fr 1fr;
            }

            .section-card {
                padding: 20px;
            }

            .quick-action {
                align-items: flex-start;
                flex-direction: column;
            }

        }

        @media (max-width: 450px) {

            .sidebar-nav {
                grid-template-columns: 1fr;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .profile-contact {
                flex-direction: column;
                gap: 8px;
            }

            .profile-actions {
                align-items: stretch;
                flex-direction: column;
            }

            .profile-actions .btn {
                width: 100%;
            }

        }

        @media (prefers-reduced-motion: reduce) {

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


<!-- =========================================
     SIDEBAR
========================================= -->

<aside class="sidebar">

    <div class="sidebar-logo">

        <div class="sidebar-logo-icon">
            <i class="fa-solid fa-briefcase"></i>
        </div>

        <div class="sidebar-logo-text">
            <h2>SMARTHIRE</h2>
            <span>Job Seeker Portal</span>
        </div>

    </div>


    <nav class="sidebar-nav">

        <a href="${pageContext.request.contextPath}/user-dashboard.jsp">
            <i class="fa-solid fa-gauge"></i>
            <span>Dashboard</span>
        </a>

        <a href="${pageContext.request.contextPath}/viewjob">
            <i class="fa-solid fa-briefcase"></i>
            <span>Browse Jobs</span>
        </a>

        <a href="${pageContext.request.contextPath}/savedjob">
            <i class="fa-solid fa-heart"></i>
            <span>Saved Jobs</span>
        </a>

        <a href="${pageContext.request.contextPath}/myapplications">
            <i class="fa-solid fa-file-lines"></i>
            <span>My Applications</span>
        </a>

        <a href="${pageContext.request.contextPath}/profile.jsp"
           class="active">
            <i class="fa-solid fa-user"></i>
            <span>Profile</span>
        </a>

        <div class="nav-divider"></div>

        <a href="${pageContext.request.contextPath}/logout"
           class="logout-link">
            <i class="fa-solid fa-right-from-bracket"></i>
            <span>Logout</span>
        </a>

    </nav>

</aside>


<!-- =========================================
     MAIN CONTENT
========================================= -->

<main class="main-content">


    <!-- TOPBAR -->

    <header class="topbar fade-up">

        <div>

            <div class="eyebrow">
                Candidate Workspace
            </div>

            <h1>My Profile</h1>

        </div>


        <div class="topbar-right">

            <a href="${pageContext.request.contextPath}/home.jsp"
               class="btn btn-secondary btn-sm">

                <i class="fa-solid fa-house"></i>
                Home

            </a>


            <a href="${pageContext.request.contextPath}/user-dashboard.jsp"
               class="btn btn-secondary btn-sm">

                Dashboard

            </a>


            <a href="${pageContext.request.contextPath}/logout"
               class="btn btn-secondary btn-sm">

                <i class="fa-solid fa-right-from-bracket"></i>
                Logout

            </a>

        </div>

    </header>


    <div class="profile-page">


        <!-- =====================================
             COVER
        ===================================== -->

        <section class="profile-cover fade-up delay-1">

            <div class="cover-content">

                <div class="cover-label">
                    <i class="fa-solid fa-user-check"></i>
                    Candidate Profile
                </div>

                <h2>Build a profile recruiters remember.</h2>

                <p>
                    Keep your professional information clear and up to date.
                </p>

            </div>

        </section>


        <!-- =====================================
             PROFILE HEADER
        ===================================== -->

        <section class="profile-header fade-up delay-1">

            <div class="profile-header-inner">


                <div class="avatar">
                    ${user.name.substring(0,1)}
                </div>


                <div class="profile-info">

                    <div class="profile-name-row">

                        <h2>${user.name}</h2>

                        <span class="role-badge">
                            <i class="fa-solid fa-circle-check"></i>
                            ${user.role}
                        </span>

                    </div>


                    <div class="profile-contact">

                        <span class="contact-item">

                            <i class="fa-solid fa-envelope"></i>

                            ${user.email}

                        </span>


                        <span class="contact-item">

                            <i class="fa-solid fa-location-dot"></i>

                            Pune, Maharashtra, India

                        </span>

                    </div>


                    <div class="profile-actions">

                        <form action="${pageContext.request.contextPath}/editprofile"
                              method="get">

                            <input
                                type="hidden"
                                name="userId"
                                value="${user.id}">

                            <button
                                type="submit"
                                class="btn btn-primary btn-sm">

                                <i class="fa-solid fa-pen"></i>
                                Edit Profile

                            </button>

                        </form>


                        <p class="success-message">
                            ${msg}
                        </p>

                    </div>

                </div>

            </div>

        </section>


        <!-- =====================================
             STATS
        ===================================== -->

        <section class="stats-grid fade-up delay-2">


            <div class="stat-card">

                <div class="stat-top">

                    <div class="stat-icon">
                        <i class="fa-solid fa-file-circle-check"></i>
                    </div>

                </div>

                <div class="stat-number">12</div>

                <div class="stat-label">
                    Applications
                </div>

            </div>


            <div class="stat-card">

                <div class="stat-top">

                    <div class="stat-icon">
                        <i class="fa-solid fa-heart"></i>
                    </div>

                </div>

                <div class="stat-number">5</div>

                <div class="stat-label">
                    Saved Jobs
                </div>

            </div>


            <div class="stat-card">

                <div class="stat-top">

                    <div class="stat-icon">
                        <i class="fa-solid fa-calendar-check"></i>
                    </div>

                </div>

                <div class="stat-number">2</div>

                <div class="stat-label">
                    Interviews
                </div>

            </div>


            <div class="stat-card">

                <div class="stat-top">

                    <div class="stat-icon">
                        <i class="fa-solid fa-trophy"></i>
                    </div>

                </div>

                <div class="stat-number">3</div>

                <div class="stat-label">
                    Offers
                </div>

            </div>


        </section>


        <!-- =====================================
             CONTENT
        ===================================== -->

        <section class="content-grid fade-up delay-3">


            <!-- ABOUT -->

            <div class="section-card">

                <div class="section-heading">

                    <div class="section-heading-icon">
                        <i class="fa-solid fa-user"></i>
                    </div>

                    <h3>About</h3>

                </div>


                <p class="about-text">

                    Passionate Full Stack Developer with strong skills in
                    Java, Spring Boot, Hibernate, SQL, HTML, CSS, JavaScript
                    and React.

                </p>

            </div>


            <!-- ACCOUNT DETAILS -->

            <div class="section-card">

                <div class="section-heading">

                    <div class="section-heading-icon">
                        <i class="fa-solid fa-shield-halved"></i>
                    </div>

                    <h3>Account</h3>

                </div>


                <div class="details-list">


                    <div class="detail-row">

                        <span class="detail-label">
                            Account ID
                        </span>

                        <span class="detail-value">
                            #${user.id}
                        </span>

                    </div>


                    <div class="detail-row">

                        <span class="detail-label">
                            Role
                        </span>

                        <span class="detail-value">
                            ${user.role}
                        </span>

                    </div>


                    <div class="detail-row">

                        <span class="detail-label">
                            Status
                        </span>

                        <span class="detail-value active-status">
                            Active
                        </span>

                    </div>


                </div>

            </div>


            <!-- SKILLS -->

            <div class="section-card">

                <div class="section-heading">

                    <div class="section-heading-icon">
                        <i class="fa-solid fa-code"></i>
                    </div>

                    <h3>Skills</h3>

                </div>


                <div class="skills">

                    <span class="skill-chip">Java</span>
                    <span class="skill-chip">Spring Boot</span>
                    <span class="skill-chip">Hibernate</span>
                    <span class="skill-chip">SQL</span>
                    <span class="skill-chip">React</span>
                    <span class="skill-chip">HTML</span>
                    <span class="skill-chip">CSS</span>
                    <span class="skill-chip">JavaScript</span>

                </div>

            </div>


            <!-- PROFILE COMPLETION -->

            <div class="section-card">

                <div class="section-heading">

                    <div class="section-heading-icon">
                        <i class="fa-solid fa-chart-simple"></i>
                    </div>

                    <h3>Profile Completion</h3>

                </div>


                <div class="completion-header">

                    <span>
                        Your profile is almost ready
                    </span>

                    <span class="completion-percent">
                        80%
                    </span>

                </div>


                <div class="progress-track">

                    <div class="progress-fill"></div>

                </div>


                <p class="completion-note">

                    Add more professional details to make your profile
                    more useful when applying for jobs.

                </p>

            </div>


        </section>


        <!-- =====================================
             QUICK ACTION
        ===================================== -->

        <section class="quick-action fade-up delay-3">

            <div>

                <h3>Ready for your next opportunity?</h3>

                <p>
                    Explore fresh openings that match your career goals.
                </p>

            </div>


            <a href="${pageContext.request.contextPath}/viewjob"
               class="btn">

                <i class="fa-solid fa-magnifying-glass"></i>
                Browse Jobs

            </a>

        </section>


    </div>

</main>


</body>
</html>