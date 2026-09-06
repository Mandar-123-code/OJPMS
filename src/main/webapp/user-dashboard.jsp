<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Dashboard | SMARTHIRE</title>


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

            --blue: #527f9e;
            --blue-soft: #eaf1f5;

            --green: #3d765b;

            --shadow:
                0 18px 45px rgba(19, 33, 30, 0.07);
        }


        * {
            margin: 0;
            padding: 0;

            box-sizing: border-box;
        }


        body {
            min-height: 100vh;

            background: var(--paper);

            color: var(--ink);

            font-family: "DM Sans", sans-serif;
        }


        a {
            color: inherit;

            text-decoration: none;
        }


        /* =========================================
           SIDEBAR
        ========================================= */

        .sidebar {
            position: fixed;

            top: 0;
            left: 0;

            width: 250px;
            height: 100vh;

            padding: 25px 16px;

            background: var(--ink);

            color: white;

            z-index: 100;

            overflow-y: auto;
        }


        .sidebar-logo {
            display: flex;
            align-items: center;

            gap: 12px;

            padding: 5px 10px 30px;
        }


        .sidebar-logo-icon {
            width: 43px;
            height: 43px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 13px;

            background: var(--mint);

            color: var(--ink);

            font-size: 18px;
        }


        .sidebar-logo-text h2 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 19px;

            letter-spacing: -0.5px;
        }


        .sidebar-logo-text span {
            display: block;

            margin-top: 2px;

            color: #9ba9a3;

            font-size: 11px;
        }


        .sidebar-nav {
            display: flex;
            flex-direction: column;

            gap: 5px;
        }


        .sidebar-nav a {
            min-height: 46px;

            display: flex;
            align-items: center;

            gap: 13px;

            padding: 0 13px;

            border-radius: 11px;

            color: #aebbb5;

            font-size: 14px;
            font-weight: 500;

            transition:
                background 0.25s ease,
                color 0.25s ease,
                transform 0.25s ease;
        }


        .sidebar-nav a i {
            width: 18px;

            text-align: center;

            font-size: 14px;
        }


        .sidebar-nav a:hover {
            background: rgba(255, 255, 255, 0.07);

            color: white;

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

            margin: 12px 8px;

            background: rgba(255, 255, 255, 0.09);
        }


        .logout-link {
            color: #e6aaa0 !important;
        }


        .logout-link:hover {
            background: rgba(242, 121, 97, 0.10) !important;

            color: #ffb5a7 !important;
        }


        /* =========================================
           MAIN
        ========================================= */

        .main-content {
            min-height: 100vh;

            margin-left: 250px;

            padding: 0 38px 60px;
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
        }


        .topbar-left h1 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 23px;

            letter-spacing: -0.8px;
        }


        .topbar-right {
            display: flex;
            align-items: center;

            gap: 8px;
        }


        .topbar-btn {
            min-height: 38px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 7px;

            padding: 0 13px;

            border: 1px solid var(--line);

            border-radius: 9px;

            background: white;

            color: #53615b;

            font-size: 10px;
            font-weight: 700;

            transition: 0.22s ease;
        }


        .topbar-btn:hover {
            border-color: #aebbb2;

            color: var(--ink);

            transform: translateY(-1px);
        }


        /* =========================================
           WELCOME BANNER
        ========================================= */

        .welcome-banner {
            position: relative;

            min-height: 220px;

            display: flex;
            align-items: center;

            margin-top: 28px;

            padding: 35px 38px;

            overflow: hidden;

            border-radius: 20px;

            background: var(--ink);

            color: white;

            box-shadow:
                0 18px 40px rgba(19, 33, 30, 0.13);

            animation: fadeUp 0.5s ease both;
        }


        .welcome-banner::before {
            content: "";

            position: absolute;

            width: 290px;
            height: 290px;

            right: -80px;
            top: -135px;

            border: 1px solid rgba(217, 246, 127, 0.16);

            border-radius: 50%;
        }


        .welcome-banner::after {
            content: "";

            position: absolute;

            width: 180px;
            height: 180px;

            right: 90px;
            bottom: -130px;

            border: 1px solid rgba(242, 121, 97, 0.16);

            border-radius: 50%;
        }


        .welcome-content {
            position: relative;

            z-index: 2;

            max-width: 690px;
        }


        .welcome-kicker {
            display: inline-flex;
            align-items: center;

            gap: 7px;

            margin-bottom: 13px;

            color: var(--mint);

            font-size: 9px;
            font-weight: 700;

            text-transform: uppercase;

            letter-spacing: 1.4px;
        }


        .welcome-kicker i {
            font-size: 8px;
        }


        .welcome-banner h1 {
            font-family: "Space Grotesk", sans-serif;

            font-size: clamp(27px, 3vw, 37px);

            line-height: 1.1;

            letter-spacing: -1.3px;
        }


        .welcome-banner h1 span {
            color: var(--mint);
        }


        .welcome-banner p {
            max-width: 560px;

            margin-top: 12px;

            color: #aebbb5;

            font-size: 12px;

            line-height: 1.6;
        }


        .welcome-actions {
            display: flex;

            gap: 9px;

            margin-top: 22px;
        }


        .welcome-primary,
        .welcome-secondary {
            min-height: 41px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 7px;

            padding: 0 14px;

            border-radius: 9px;

            font-size: 10px;
            font-weight: 700;

            transition: 0.22s ease;
        }


        .welcome-primary {
            background: var(--mint);

            color: var(--ink);
        }


        .welcome-primary:hover {
            transform: translateY(-2px);

            box-shadow:
                0 8px 20px rgba(217, 246, 127, 0.14);
        }


        .welcome-secondary {
            border: 1px solid rgba(255, 255, 255, 0.18);

            background: rgba(255, 255, 255, 0.06);

            color: white;
        }


        .welcome-secondary:hover {
            background: rgba(255, 255, 255, 0.11);

            transform: translateY(-2px);
        }


        /* =========================================
           STATS
        ========================================= */

        .stats-grid {
            display: grid;

            grid-template-columns:
                repeat(4, minmax(0, 1fr));

            gap: 14px;

            margin-top: 20px;
        }


        .stat-card {
            position: relative;

            min-height: 126px;

            padding: 19px;

            overflow: hidden;

            border: 1px solid var(--line);

            border-radius: 15px;

            background: white;

            box-shadow:
                0 7px 22px rgba(19, 33, 30, 0.035);

            cursor: pointer;

            transition:
                transform 0.24s ease,
                box-shadow 0.24s ease,
                border-color 0.24s ease;

            animation: fadeUp 0.55s ease both;
        }


        .stat-card:hover {
            transform: translateY(-4px);

            border-color: #c5cec6;

            box-shadow:
                0 15px 30px rgba(19, 33, 30, 0.07);
        }


        .stat-card:nth-child(1) {
            animation-delay: 0.04s;
        }


        .stat-card:nth-child(2) {
            animation-delay: 0.08s;
        }


        .stat-card:nth-child(3) {
            animation-delay: 0.12s;
        }


        .stat-card:nth-child(4) {
            animation-delay: 0.16s;
        }


        .stat-icon {
            width: 36px;
            height: 36px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 10px;

            background: var(--soft);

            color: var(--green);

            font-size: 13px;
        }


        .stat-card:nth-child(2) .stat-icon {
            color: var(--coral);

            background: #fff0ec;
        }


        .stat-card:nth-child(3) .stat-icon {
            color: var(--blue);

            background: var(--blue-soft);
        }


        .stat-card:nth-child(4) .stat-icon {
            color: #a27424;

            background: #fff6df;
        }


        .stat-number {
            margin-top: 14px;

            font-family: "Space Grotesk", sans-serif;

            font-size: 25px;
            font-weight: 700;

            line-height: 1;
        }


        .stat-label {
            margin-top: 5px;

            color: var(--muted);

            font-size: 10px;
            font-weight: 500;
        }


        /* =========================================
           DASHBOARD GRID
        ========================================= */

        .dashboard-grid {
            display: grid;

            grid-template-columns:
                minmax(0, 1.05fr)
                minmax(0, 1fr);

            gap: 18px;

            margin-top: 20px;
        }


        .dashboard-card {
            padding: 23px;

            border: 1px solid var(--line);

            border-radius: 16px;

            background: white;

            box-shadow:
                0 8px 25px rgba(19, 33, 30, 0.04);

            animation: fadeUp 0.6s ease both;
        }


        .card-title {
            display: flex;
            align-items: center;

            gap: 9px;

            font-family: "Space Grotesk", sans-serif;

            font-size: 16px;

            letter-spacing: -0.4px;
        }


        .card-title i {
            color: var(--coral);

            font-size: 14px;
        }


        .card-desc {
            margin-top: 8px;

            color: var(--muted);

            font-size: 10px;

            line-height: 1.5;
        }


        /* =========================================
           QUICK ACTIONS
        ========================================= */

        .quick-actions {
            display: flex;
            flex-direction: column;

            margin-top: 17px;
        }


        .quick-action-item {
            min-height: 62px;

            display: flex;
            align-items: center;

            gap: 12px;

            padding: 9px 5px;

            border-bottom: 1px solid #edf0eb;

            transition:
                padding 0.22s ease,
                background 0.22s ease;
        }


        .quick-action-item:last-child {
            border-bottom: none;
        }


        .quick-action-item:hover {
            padding-left: 9px;

            background: #fafbf8;
        }


        .qa-icon {
            width: 38px;
            height: 38px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 10px;

            background: var(--soft);

            color: var(--green);

            font-size: 12px;
        }


        .quick-action-item:nth-child(2) .qa-icon {
            background: var(--blue-soft);

            color: var(--blue);
        }


        .quick-action-item:nth-child(3) .qa-icon {
            background: #fff0ec;

            color: var(--coral);
        }


        .quick-action-item:nth-child(4) .qa-icon {
            background: #fff6df;

            color: #a27424;
        }


        .qa-content {
            flex: 1;

            min-width: 0;
        }


        .qa-content h4 {
            font-size: 11px;
            font-weight: 700;
        }


        .qa-content p {
            margin-top: 3px;

            color: var(--muted);

            font-size: 9px;
        }


        .qa-arrow {
            color: #a1aca6;

            font-size: 9px;

            transition: 0.2s ease;
        }


        .quick-action-item:hover .qa-arrow {
            color: var(--ink);

            transform: translateX(3px);
        }


        /* =========================================
           JOB SECTION
        ========================================= */

        .job-section {
            position: relative;

            overflow: hidden;
        }


        .job-section::after {
            content: "";

            position: absolute;

            width: 160px;
            height: 160px;

            right: -75px;
            top: -75px;

            border: 1px solid #e1e6de;

            border-radius: 50%;
        }


        .job-section-cta {
            margin-top: 25px;
        }


        .browse-btn {
            min-height: 46px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 8px;

            padding: 0 17px;

            border-radius: 10px;

            background: var(--ink);

            color: white;

            font-size: 10px;
            font-weight: 700;

            transition: 0.22s ease;
        }


        .browse-btn:hover {
            background: #263a35;

            transform: translateY(-2px);

            box-shadow:
                0 9px 20px rgba(19, 33, 30, 0.13);
        }


        .job-tips {
            display: flex;
            flex-direction: column;

            gap: 10px;

            margin-top: 25px;

            padding-top: 19px;

            border-top: 1px solid #edf0eb;
        }


        .tip {
            display: flex;
            align-items: flex-start;

            gap: 9px;

            color: #65736c;

            font-size: 9px;

            line-height: 1.5;
        }


        .tip i {
            width: 14px;

            margin-top: 1px;

            color: var(--coral);

            text-align: center;
        }


        /* =========================================
           ANIMATION
        ========================================= */

        @keyframes fadeUp {

            from {
                opacity: 0;

                transform: translateY(13px);
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

            .stats-grid {
                grid-template-columns:
                    repeat(2, minmax(0, 1fr));
            }


            .dashboard-grid {
                grid-template-columns: 1fr;
            }

        }


        @media (max-width: 850px) {

            .sidebar {
                width: 215px;
            }


            .main-content {
                margin-left: 215px;

                padding-left: 27px;
                padding-right: 27px;
            }


            .welcome-banner {
                padding: 30px;
            }

        }


        @media (max-width: 650px) {

            .sidebar {
                position: static;

                width: 100%;
                height: auto;

                padding: 15px;
            }


            .sidebar-logo {
                padding-bottom: 15px;
            }


            .sidebar-nav {
                display: grid;

                grid-template-columns: repeat(2, 1fr);
            }


            .nav-divider {
                display: none;
            }


            .main-content {
                margin-left: 0;

                padding: 0 15px 40px;
            }


            .topbar {
                min-height: 72px;
            }


            .topbar-right {
                display: none;
            }


            .welcome-banner {
                margin-top: 20px;

                padding: 27px 22px;

                border-radius: 16px;
            }


            .welcome-actions {
                flex-direction: column;

                align-items: stretch;
            }


            .welcome-primary,
            .welcome-secondary {
                width: 100%;
            }


            .stats-grid {
                grid-template-columns:
                    repeat(2, minmax(0, 1fr));

                gap: 10px;
            }


            .stat-card {
                min-height: 115px;

                padding: 15px;
            }

        }


        @media (max-width: 450px) {

            .sidebar-nav {
                grid-template-columns: 1fr;
            }


            .topbar-left h1 {
                font-size: 20px;
            }


            .stats-grid {
                grid-template-columns: 1fr 1fr;
            }


            .dashboard-card {
                padding: 19px;
            }

        }

    </style>

</head>


<body>


<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
        return;
    }
%>


<!-- =========================================
     SIDEBAR
========================================= -->

<div class="sidebar">


    <div class="sidebar-logo">


        <div class="sidebar-logo-icon">

            <i class="fa-solid fa-briefcase"></i>

        </div>


        <div class="sidebar-logo-text">

            <h2>SMARTHIRE</h2>

            <span>
                Job Seeker Portal
            </span>

        </div>


    </div>


    <nav class="sidebar-nav">


        <a
            href="${pageContext.request.contextPath}/user-dashboard.jsp"
            class="active">

            <i class="fa-solid fa-gauge"></i>

            <span>Dashboard</span>

        </a>


        <a
            href="${pageContext.request.contextPath}/viewjob">

            <i class="fa-solid fa-briefcase"></i>

            <span>Browse Jobs</span>

        </a>


        <a
            href="${pageContext.request.contextPath}/savedjob">

            <i class="fa-solid fa-heart"></i>

            <span>Saved Jobs</span>

        </a>


        <a
            href="${pageContext.request.contextPath}/myapplications">

            <i class="fa-solid fa-file-lines"></i>

            <span>My Applications</span>

        </a>


        <a
            href="${pageContext.request.contextPath}/profile.jsp">

            <i class="fa-solid fa-user"></i>

            <span>Profile</span>

        </a>


        <div class="nav-divider"></div>


        <a
            href="${pageContext.request.contextPath}/logout"
            class="logout-link">

            <i class="fa-solid fa-right-from-bracket"></i>

            <span>Logout</span>

        </a>


    </nav>

</div>


<!-- =========================================
     MAIN CONTENT
========================================= -->

<div class="main-content">


    <!-- TOPBAR -->

    <div class="topbar">


        <div class="topbar-left">

            <h1>
                Dashboard
            </h1>

        </div>


        <div class="topbar-right">


            <a
                href="${pageContext.request.contextPath}/home.jsp"
                class="topbar-btn">

                <i class="fa-solid fa-house"></i>

                Home

            </a>


            <a
                href="${pageContext.request.contextPath}/logout"
                class="topbar-btn">

                <i class="fa-solid fa-right-from-bracket"></i>

                Logout

            </a>


        </div>


    </div>


    <!-- =========================================
         WELCOME
    ========================================= -->

    <section class="welcome-banner">


        <div class="welcome-content">


            <div class="welcome-kicker">

                <i class="fa-solid fa-sparkles"></i>

                Candidate Dashboard

            </div>


            <h1>

                Welcome Back,

                <span>
                    ${user.name}
                </span>

                &#x1F44B;

            </h1>


            <p>
                Explore new opportunities, track your applications,
                and take the next step toward your career goals.
            </p>


            <div class="welcome-actions">


                <a
                    href="${pageContext.request.contextPath}/viewjob"
                    class="welcome-primary">

                    <i class="fa-solid fa-briefcase"></i>

                    Browse Jobs

                </a>


                <a
                    href="${pageContext.request.contextPath}/myapplications"
                    class="welcome-secondary">

                    <i class="fa-solid fa-file-lines"></i>

                    My Applications

                </a>


            </div>


        </div>


    </section>


    <!-- =========================================
         STATS
    ========================================= -->

    <section class="stats-grid">


        <div
            class="stat-card"
            onclick="window.location.href='${pageContext.request.contextPath}/myapplications'">


            <i class="fa-solid fa-file-circle-check stat-icon"></i>


            <div class="stat-number">
                12
            </div>


            <div class="stat-label">
                Applications
            </div>


        </div>


        <div
            class="stat-card"
            onclick="window.location.href='${pageContext.request.contextPath}/savedjob'">


            <i class="fa-solid fa-heart stat-icon"></i>


            <div class="stat-number">
                5
            </div>


            <div class="stat-label">
                Saved Jobs
            </div>


        </div>


        <div class="stat-card">


            <i class="fa-solid fa-calendar-check stat-icon"></i>


            <div class="stat-number">
                2
            </div>


            <div class="stat-label">
                Interview Calls
            </div>


        </div>


        <div class="stat-card">


            <i class="fa-solid fa-trophy stat-icon"></i>


            <div class="stat-number">
                3
            </div>


            <div class="stat-label">
                Offers
            </div>


        </div>


    </section>


    <!-- =========================================
         LOWER DASHBOARD
    ========================================= -->

    <section class="dashboard-grid">


        <!-- QUICK ACTIONS -->

        <div class="dashboard-card">


            <h2 class="card-title">

                <i class="fa-solid fa-bolt"></i>

                Quick Actions

            </h2>


            <div class="quick-actions">


                <a
                    href="${pageContext.request.contextPath}/viewjob"
                    class="quick-action-item">


                    <div class="qa-icon">

                        <i class="fa-solid fa-magnifying-glass"></i>

                    </div>


                    <div class="qa-content">

                        <h4>
                            Browse Jobs
                        </h4>

                        <p>
                            Find your perfect role
                        </p>

                    </div>


                    <i class="fa-solid fa-chevron-right qa-arrow"></i>


                </a>


                <a
                    href="${pageContext.request.contextPath}/myapplications"
                    class="quick-action-item">


                    <div class="qa-icon">

                        <i class="fa-solid fa-file-lines"></i>

                    </div>


                    <div class="qa-content">

                        <h4>
                            My Applications
                        </h4>

                        <p>
                            Track application status
                        </p>

                    </div>


                    <i class="fa-solid fa-chevron-right qa-arrow"></i>


                </a>


                <a
                    href="${pageContext.request.contextPath}/savedjob"
                    class="quick-action-item">


                    <div class="qa-icon">

                        <i class="fa-solid fa-heart"></i>

                    </div>


                    <div class="qa-content">

                        <h4>
                            Saved Jobs
                        </h4>

                        <p>
                            Jobs you bookmarked
                        </p>

                    </div>


                    <i class="fa-solid fa-chevron-right qa-arrow"></i>


                </a>


                <a
                    href="${pageContext.request.contextPath}/profile.jsp"
                    class="quick-action-item">


                    <div class="qa-icon">

                        <i class="fa-solid fa-user"></i>

                    </div>


                    <div class="qa-content">

                        <h4>
                            My Profile
                        </h4>

                        <p>
                            Update your information
                        </p>

                    </div>


                    <i class="fa-solid fa-chevron-right qa-arrow"></i>


                </a>


            </div>


        </div>


        <!-- FIND JOBS -->

        <div class="dashboard-card job-section">


            <h2 class="card-title">

                <i class="fa-solid fa-briefcase"></i>

                Find Your Dream Job

            </h2>


            <p class="card-desc">

                Discover relevant opportunities from recruiters
                and apply to roles that match your career goals.

            </p>


            <div class="job-section-cta">


                <a
                    href="${pageContext.request.contextPath}/viewjob"
                    class="browse-btn">

                    Browse All Jobs

                    <i class="fa-solid fa-arrow-right"></i>

                </a>


            </div>


            <div class="job-tips">


                <div class="tip">

                    <i class="fa-solid fa-lightbulb"></i>

                    <span>
                        Complete your profile to make a stronger
                        impression on recruiters.
                    </span>

                </div>


                <div class="tip">

                    <i class="fa-solid fa-bell"></i>

                    <span>
                        Check regularly for newly posted
                        opportunities.
                    </span>

                </div>


                <div class="tip">

                    <i class="fa-solid fa-bookmark"></i>

                    <span>
                        Save interesting jobs so you can
                        revisit them later.
                    </span>

                </div>


            </div>


        </div>


    </section>


</div>


</body>

</html>