<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page isELIgnored="false" %>

<%@ taglib prefix="c"
    uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Saved Jobs | SMARTHIRE</title>


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

            --green: #3d765b;
            --green-soft: #e7f2eb;

            --heart: #d96858;
            --heart-soft: #fae9e5;

            --shadow: 0 18px 45px rgba(19, 33, 30, 0.08);
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
            display: flex;
            align-items: center;

            gap: 13px;

            min-height: 46px;

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

            margin: 14px 8px;

            background: rgba(255, 255, 255, 0.09);
        }


        .logout-link {
            color: #e5aaa0 !important;
        }


        .logout-link:hover {
            background: rgba(242, 121, 97, 0.10) !important;

            color: #ffb2a4 !important;
        }


        /* =========================================
           MAIN
        ========================================= */

        .main-content {
            margin-left: 250px;

            min-height: 100vh;

            padding: 0 38px 55px;
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


        .topbar-left {
            display: flex;
            align-items: center;

            gap: 12px;
        }


        .topbar-left h1 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 23px;

            letter-spacing: -0.8px;
        }


        .sj-back-btn {
            width: 36px;
            height: 36px;

            display: flex;
            align-items: center;
            justify-content: center;

            border: 1px solid var(--line);

            border-radius: 9px;

            background: rgba(255, 255, 255, 0.65);

            color: #56655e;

            font-size: 11px;

            transition: 0.22s ease;
        }


        .sj-back-btn:hover {
            background: white;

            color: var(--ink);

            transform: translateX(-2px);
        }


        .topbar-right {
            display: flex;
            align-items: center;

            gap: 8px;
        }


        .top-btn {
            min-height: 38px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 7px;

            padding: 0 13px;

            border-radius: 9px;

            font-size: 10px;
            font-weight: 700;

            transition: 0.22s ease;
        }


        .top-btn.primary {
            background: var(--ink);

            color: white;
        }


        .top-btn.primary:hover {
            background: #20332f;

            transform: translateY(-2px);

            box-shadow: 0 7px 16px rgba(19, 33, 30, 0.14);
        }


        .top-btn.secondary {
            border: 1px solid var(--line);

            background: white;

            color: var(--ink);
        }


        .top-btn.secondary:hover {
            border-color: #bac5bc;

            transform: translateY(-2px);
        }


        /* =========================================
           COUNT BANNER
        ========================================= */

        .count-banner {
            position: relative;

            display: flex;
            align-items: center;

            gap: 16px;

            margin-top: 28px;

            padding: 21px 24px;

            overflow: hidden;

            border: 1px solid var(--line);

            border-radius: 17px;

            background: white;

            box-shadow:
                0 10px 25px rgba(19, 33, 30, 0.04);

            animation: fadeUp 0.5s ease both;
        }


        .count-banner::after {
            content: "";

            position: absolute;

            width: 170px;
            height: 170px;

            right: -80px;
            top: -105px;

            border: 1px solid #ead8d2;

            border-radius: 50%;
        }


        .sj-heart-icon {
            width: 48px;
            height: 48px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 14px;

            background: var(--heart-soft);

            color: var(--heart);

            font-size: 17px;
        }


        .count-num {
            font-family: "Space Grotesk", sans-serif;

            font-size: 27px;
            font-weight: 700;

            letter-spacing: -1px;
        }


        .count-label {
            margin-top: 2px;

            color: var(--muted);

            font-size: 11px;
            font-weight: 500;
        }


        /* =========================================
           CONTENT
        ========================================= */

        .sj-content {
            margin-top: 20px;
        }


        /* =========================================
           JOB GRID
        ========================================= */

        .sj-grid {
            display: grid;

            grid-template-columns:
                repeat(2, minmax(0, 1fr));

            gap: 16px;
        }


        /* =========================================
           JOB CARD
        ========================================= */

        .sj-card {
            position: relative;

            display: flex;
            align-items: center;
            justify-content: space-between;

            gap: 18px;

            min-height: 145px;

            padding: 21px;

            overflow: hidden;

            border: 1px solid var(--line);

            border-radius: 17px;

            background: white;

            transition:
                transform 0.28s ease,
                box-shadow 0.28s ease,
                border-color 0.28s ease;

            animation: fadeUp 0.55s ease both;
        }


        .sj-card:hover {
            transform: translateY(-5px);

            border-color: #c4cec5;

            box-shadow:
                0 16px 35px rgba(19, 33, 30, 0.09);
        }


        .sj-card::before {
            content: "";

            position: absolute;

            left: 0;
            top: 0;

            width: 3px;
            height: 100%;

            background: var(--coral);

            opacity: 0.8;
        }


        .sj-card-left {
            min-width: 0;

            display: flex;
            align-items: center;

            gap: 14px;
        }


        /* =========================================
           COMPANY ICON
        ========================================= */

        .sj-logo {
            width: 50px;
            height: 50px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 14px;

            background: var(--soft);

            color: var(--ink);

            font-size: 17px;

            transition:
                transform 0.25s ease,
                background 0.25s ease;
        }


        .sj-card:hover .sj-logo {
            transform: rotate(-3deg) scale(1.04);

            background: #e4eadf;
        }


        /* =========================================
           JOB INFO
        ========================================= */

        .sj-info {
            min-width: 0;
        }


        .sj-info h3 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 16px;

            letter-spacing: -0.4px;

            line-height: 1.3;

            color: var(--ink);

            overflow: hidden;

            text-overflow: ellipsis;

            white-space: nowrap;
        }


        .sj-meta {
            display: flex;
            flex-wrap: wrap;

            gap: 7px 13px;

            margin-top: 9px;
        }


        .sj-meta span {
            display: inline-flex;
            align-items: center;

            gap: 5px;

            color: var(--muted);

            font-size: 10px;
        }


        .sj-meta i {
            color: var(--coral);

            font-size: 9px;
        }


        /* =========================================
           ACTION
        ========================================= */

        .sj-actions {
            flex-shrink: 0;
        }


        .apply-btn {
            min-height: 38px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            padding: 0 14px;

            border-radius: 9px;

            background: var(--ink);

            color: white;

            font-size: 10px;
            font-weight: 700;

            white-space: nowrap;

            transition:
                transform 0.22s ease,
                box-shadow 0.22s ease,
                background 0.22s ease;
        }


        .apply-btn:hover {
            background: #20332f;

            transform: translateY(-2px);

            box-shadow:
                0 8px 17px rgba(19, 33, 30, 0.14);
        }


        /* =========================================
           EMPTY STATE
        ========================================= */

        .empty-state {
            min-height: 330px;

            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;

            padding: 40px 20px;

            border: 1px dashed #cbd4ca;

            border-radius: 18px;

            background: rgba(255, 255, 255, 0.55);

            text-align: center;

            animation: fadeUp 0.5s ease both;
        }


        .empty-icon {
            width: 61px;
            height: 61px;

            display: flex;
            align-items: center;
            justify-content: center;

            margin-bottom: 17px;

            border-radius: 18px;

            background: var(--heart-soft);

            color: var(--heart);

            font-size: 21px;
        }


        .empty-state h3 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 20px;

            letter-spacing: -0.6px;
        }


        .empty-state p {
            margin-top: 7px;

            color: var(--muted);

            font-size: 12px;
        }


        .browse-btn {
            min-height: 39px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 7px;

            margin-top: 18px;

            padding: 0 15px;

            border-radius: 9px;

            background: var(--ink);

            color: white;

            font-size: 10px;
            font-weight: 700;

            transition: 0.22s ease;
        }


        .browse-btn:hover {
            background: #20332f;

            transform: translateY(-2px);

            box-shadow: 0 8px 18px rgba(19, 33, 30, 0.13);
        }


        /* =========================================
           ANIMATION
        ========================================= */

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
                padding-left: 27px;
                padding-right: 27px;
            }


            .sj-grid {
                grid-template-columns: 1fr;
            }

        }


        @media (max-width: 800px) {

            .sidebar {
                width: 215px;
            }


            .main-content {
                margin-left: 215px;
            }


            .topbar-right .secondary {
                display: none;
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


            .main-content {
                margin-left: 0;

                padding: 0 15px 40px;
            }


            .topbar {
                min-height: 72px;

                align-items: flex-start;

                flex-direction: column;

                justify-content: center;

                gap: 9px;
            }


            .topbar-right {
                display: none;
            }


            .topbar-left h1 {
                font-size: 20px;
            }


            .sj-card {
                align-items: flex-start;

                flex-direction: column;
            }


            .sj-actions {
                width: 100%;
            }


            .apply-btn {
                width: 100%;
            }

        }


        @media (max-width: 450px) {

            .sidebar-nav {
                grid-template-columns: 1fr;
            }


            .count-banner {
                padding: 18px;
            }


            .sj-card {
                padding: 18px;
            }


            .sj-meta {
                flex-direction: column;

                gap: 6px;
            }

        }

    </style>

</head>


<body>


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


        <a href="${pageContext.request.contextPath}/user-dashboard.jsp">

            <i class="fa-solid fa-gauge"></i>

            <span>Dashboard</span>

        </a>


        <a href="${pageContext.request.contextPath}/viewjob">

            <i class="fa-solid fa-briefcase"></i>

            <span>Browse Jobs</span>

        </a>


        <a href="${pageContext.request.contextPath}/savedjob"
           class="active">

            <i class="fa-solid fa-heart"></i>

            <span>Saved Jobs</span>

        </a>


        <a href="${pageContext.request.contextPath}/myapplications">

            <i class="fa-solid fa-file-lines"></i>

            <span>My Applications</span>

        </a>


        <a href="${pageContext.request.contextPath}/profile.jsp">

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


            <a
                href="${pageContext.request.contextPath}/user-dashboard.jsp"
                class="sj-back-btn">

                <i class="fa-solid fa-arrow-left"></i>

            </a>


            <h1>
                Saved Jobs
            </h1>


        </div>


        <div class="topbar-right">


            <a
                href="${pageContext.request.contextPath}/viewjob"
                class="top-btn primary">

                <i class="fa-solid fa-briefcase"></i>

                Browse More

            </a>


            <a
                href="${pageContext.request.contextPath}/logout"
                class="top-btn secondary">

                <i class="fa-solid fa-right-from-bracket"></i>

                Logout

            </a>


        </div>


    </div>


    <!-- =========================================
         COUNT BANNER
    ========================================= -->

    <div class="count-banner">


        <div class="sj-heart-icon">

            <i class="fa-solid fa-heart"></i>

        </div>


        <div>

            <div class="count-num">
                ${savedJobs.size()}
            </div>

            <div class="count-label">
                Saved Jobs
            </div>

        </div>


    </div>


    <!-- =========================================
         CONTENT
    ========================================= -->

    <div class="sj-content">


        <!-- EMPTY STATE -->

        <c:if test="${empty savedJobs}">


            <div class="empty-state">


                <div class="empty-icon">

                    <i class="fa-solid fa-heart-crack"></i>

                </div>


                <h3>
                    No Saved Jobs Yet
                </h3>


                <p>
                    Start browsing jobs and save the ones
                    that match your career goals.
                </p>


                <a
                    href="${pageContext.request.contextPath}/viewjob"
                    class="browse-btn">

                    <i class="fa-solid fa-magnifying-glass"></i>

                    Browse Jobs

                </a>


            </div>


        </c:if>


        <!-- SAVED JOBS -->

        <c:if test="${not empty savedJobs}">


            <div class="sj-grid">


                <c:forEach
                    var="s"
                    items="${savedJobs}">


                    <div class="sj-card">


                        <div class="sj-card-left">


                            <div class="sj-logo">

                                <i class="fa-solid fa-building"></i>

                            </div>


                            <div class="sj-info">


                                <h3>
                                    ${s.job.title}
                                </h3>


                                <div class="sj-meta">


                                    <span>

                                        <i class="fa-solid fa-location-dot"></i>

                                        ${s.job.location}

                                    </span>


                                    <span>

                                        <i class="fa-solid fa-indian-rupee-sign"></i>

                                        ${s.job.salary}

                                    </span>


                                </div>


                            </div>


                        </div>


                        <div class="sj-actions">


                            <a
                                href="${pageContext.request.contextPath}/viewjob"
                                class="apply-btn">

                                Apply Now

                            </a>


                        </div>


                    </div>


                </c:forEach>


            </div>


        </c:if>


    </div>


</div>


</body>

</html>