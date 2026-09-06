<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>Browse Jobs | SMARTHIRE</title>


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

            --blue: #527f9e;
            --blue-soft: #edf3f6;

            --green: #3d765b;
            --green-soft: #edf7f0;

            --red: #b85c51;
            --red-soft: #fff0ed;

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
           MAIN CONTENT
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


        .topbar-left {
            display: flex;
            align-items: center;

            gap: 13px;
        }


        .back-btn {
            width: 38px;
            height: 38px;

            display: flex;
            align-items: center;
            justify-content: center;

            border: 1px solid var(--line);

            border-radius: 9px;

            background: white;

            color: #63716a;

            font-size: 11px;

            transition: 0.22s ease;
        }


        .back-btn:hover {
            color: var(--ink);

            border-color: #aebbb2;

            transform: translateX(-2px);
        }


        .topbar h1 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 22px;

            letter-spacing: -0.7px;
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
           SEARCH SECTION
        ========================================= */

        .vj-search-section {
            position: relative;

            margin-top: 27px;

            padding: 25px;

            overflow: hidden;

            border: 1px solid #d8ded5;

            border-radius: 17px;

            background: white;

            box-shadow:
                0 10px 30px rgba(19, 33, 30, 0.035);

            animation: fadeUp 0.5s ease both;
        }


        .vj-search-section::after {
            content: "";

            position: absolute;

            width: 220px;
            height: 220px;

            right: -90px;
            top: -135px;

            border: 1px solid #e0e5dc;

            border-radius: 50%;
        }


        .search-heading {
            position: relative;

            z-index: 1;

            margin-bottom: 15px;
        }


        .search-heading h2 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 17px;

            letter-spacing: -0.4px;
        }


        .search-heading p {
            margin-top: 4px;

            color: var(--muted);

            font-size: 10px;
        }


        .search-box {
            position: relative;

            z-index: 1;

            display: flex;
            align-items: center;

            gap: 9px;
        }


        .search-bar {
            height: 43px;

            display: flex;
            align-items: center;

            flex: 1;

            max-width: 620px;

            border: 1px solid var(--line);

            border-radius: 10px;

            background: #fafbf8;

            transition:
                border-color 0.2s ease,
                box-shadow 0.2s ease;
        }


        .search-bar:focus-within {
            border-color: #9eada5;

            box-shadow:
                0 0 0 3px rgba(217, 246, 127, 0.25);
        }


        .search-bar i {
            margin-left: 14px;

            color: #85918b;

            font-size: 12px;
        }


        .search-bar input {
            width: 100%;
            height: 100%;

            padding: 0 13px;

            border: none;
            outline: none;

            background: transparent;

            color: var(--ink);

            font-family: "DM Sans", sans-serif;

            font-size: 11px;
        }


        .search-bar input::placeholder {
            color: #98a29d;
        }


        .search-btn {
            height: 43px;

            padding: 0 20px;

            border: none;

            border-radius: 10px;

            background: var(--ink);

            color: white;

            font-family: "DM Sans", sans-serif;

            font-size: 10px;
            font-weight: 700;

            cursor: pointer;

            transition: 0.22s ease;
        }


        .search-btn:hover {
            background: #263a35;

            transform: translateY(-1px);

            box-shadow:
                0 8px 18px rgba(19, 33, 30, 0.13);
        }


        .refresh-btn {
            height: 43px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 7px;

            padding: 0 14px;

            border: 1px solid var(--line);

            border-radius: 10px;

            background: #fafbf8;

            color: #59665f;

            font-size: 10px;
            font-weight: 700;

            transition: 0.22s ease;
        }


        .refresh-btn:hover {
            background: white;

            color: var(--ink);

            transform: translateY(-1px);
        }


        .vj-subtitle {
            position: relative;

            z-index: 1;

            margin-top: 12px;

            color: var(--muted);

            font-size: 10px;
        }


        /* =========================================
           JOB CONTENT
        ========================================= */

        .vj-content {
            margin-top: 23px;
        }


        .results-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;

            margin-bottom: 13px;
        }


        .results-heading h3 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 15px;

            letter-spacing: -0.3px;
        }


        .results-heading span {
            padding: 5px 9px;

            border-radius: 6px;

            background: #e9eee7;

            color: #647169;

            font-size: 9px;
            font-weight: 700;
        }


        /* =========================================
           JOB GRID
        ========================================= */

        .vj-grid {
            display: grid;

            grid-template-columns:
                repeat(2, minmax(0, 1fr));

            gap: 17px;
        }


        /* =========================================
           JOB CARD
        ========================================= */

        .job-card {
            position: relative;

            display: flex;
            flex-direction: column;

            min-width: 0;

            padding: 21px;

            border: 1px solid var(--line);

            border-radius: 16px;

            background: white;

            box-shadow:
                0 7px 24px rgba(19, 33, 30, 0.035);

            overflow: hidden;

            animation: fadeUp 0.55s ease both;

            transition:
                transform 0.25s ease,
                box-shadow 0.25s ease,
                border-color 0.25s ease;
        }


        .job-card::before {
            content: "";

            position: absolute;

            left: 0;
            top: 0;

            width: 3px;
            height: 100%;

            background: var(--mint);

            opacity: 0;

            transition: opacity 0.25s ease;
        }


        .job-card:hover {
            transform: translateY(-5px);

            border-color: #c8d1c8;

            box-shadow: var(--shadow);
        }


        .job-card:hover::before {
            opacity: 1;
        }


        /* =========================================
           JOB HEADER
        ========================================= */

        .job-card-header {
            display: flex;
            align-items: flex-start;

            gap: 13px;
        }


        .job-logo {
            width: 45px;
            height: 45px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 12px;

            background: #f0f3ec;

            color: #65736b;

            font-size: 15px;
        }


        .job-title-area {
            min-width: 0;

            flex: 1;
        }


        .job-card-header h2 {
            overflow: hidden;

            font-family: "Space Grotesk", sans-serif;

            font-size: 16px;

            line-height: 1.3;

            letter-spacing: -0.4px;

            text-overflow: ellipsis;

            white-space: nowrap;
        }


        .job-card-company {
            margin-top: 4px;

            color: var(--muted);

            font-size: 9px;
        }


        .hiring-badge {
            display: inline-flex;
            align-items: center;

            gap: 5px;

            margin-top: 8px;

            padding: 4px 7px;

            border-radius: 5px;

            background: var(--green-soft);

            color: var(--green);

            font-size: 7px;
            font-weight: 800;

            letter-spacing: 0.35px;

            text-transform: uppercase;
        }


        .hiring-badge i {
            font-size: 6px;
        }


        /* =========================================
           META
        ========================================= */

        .job-card-meta {
            display: flex;
            flex-wrap: wrap;

            gap: 7px;

            margin-top: 18px;
        }


        .job-card-meta span {
            min-height: 29px;

            display: inline-flex;
            align-items: center;

            gap: 6px;

            padding: 0 8px;

            border: 1px solid #e4e8e1;

            border-radius: 7px;

            background: #fafbf8;

            color: #637069;

            font-size: 8px;
            font-weight: 600;
        }


        .job-card-meta span i {
            color: #89958f;

            font-size: 8px;
        }


        /* =========================================
           DESCRIPTION
        ========================================= */

        .job-desc-text {
            display: -webkit-box;

            margin-top: 16px;

            color: #6d7973;

            font-size: 10px;

            line-height: 1.6;

            overflow: hidden;

            -webkit-box-orient: vertical;

            -webkit-line-clamp: 3;
        }


        .job-desc-text strong {
            color: #46544d;

            font-weight: 700;
        }


        /* =========================================
           JOB ACTION
        ========================================= */

        .job-action {
            margin-top: 19px;

            padding-top: 15px;

            border-top: 1px solid #edf0eb;
        }


        .job-action-btns {
            display: grid;

            grid-template-columns:
                1fr 1fr;

            gap: 8px;
        }


        .apply-btn {
            width: 100%;
            min-height: 39px;

            border: none;

            border-radius: 9px;

            background: var(--ink);

            color: white;

            font-family: "DM Sans", sans-serif;

            font-size: 9px;
            font-weight: 700;

            cursor: pointer;

            transition: 0.22s ease;
        }


        .apply-btn:hover {
            background: #263a35;

            transform: translateY(-1px);

            box-shadow:
                0 8px 17px rgba(19, 33, 30, 0.13);
        }


        .save-job-btn {
            min-height: 39px;

            display: flex;
            align-items: center;
            justify-content: center;

            gap: 6px;

            border: 1px solid #e3d6d2;

            border-radius: 9px;

            background: #fffafa;

            color: #9a6259;

            font-size: 9px;
            font-weight: 700;

            transition: 0.22s ease;
        }


        .save-job-btn i {
            font-size: 9px;
        }


        .save-job-btn:hover {
            border-color: #d9bdb7;

            background: #fff3f0;

            transform: translateY(-1px);
        }


        /* =========================================
           CLOSED JOB
        ========================================= */

        .closed-job {
            min-height: 39px;

            display: flex;
            align-items: center;
            justify-content: center;

            gap: 7px;

            border: 1px solid #e5e6e2;

            border-radius: 9px;

            background: #f5f5f2;

            color: #8b928d;

            font-size: 9px;
            font-weight: 700;
        }


        .closed-job i {
            color: #a2a8a3;

            font-size: 11px;
        }


        /* =========================================
           ERROR
        ========================================= */

        .error-msg {
            display: flex;
            align-items: center;

            gap: 7px;

            margin-top: 10px;

            padding: 9px 10px;

            border: 1px solid #f0d0cb;

            border-radius: 8px;

            background: var(--red-soft);

            color: var(--red);

            font-size: 9px;

            line-height: 1.4;
        }


        .error-msg i {
            flex-shrink: 0;
        }


        /* =========================================
           EMPTY STATE
        ========================================= */

        .empty-state {
            max-width: 590px;

            margin: 20px auto;

            padding: 58px 25px;

            text-align: center;

            border: 1px solid var(--line);

            border-radius: 17px;

            background: white;

            box-shadow:
                0 12px 35px rgba(19, 33, 30, 0.05);

            animation: fadeUp 0.5s ease both;
        }


        .empty-icon {
            width: 61px;
            height: 61px;

            display: flex;
            align-items: center;
            justify-content: center;

            margin: 0 auto 17px;

            border-radius: 17px;

            background: #eef1eb;

            color: #7a8780;

            font-size: 21px;
        }


        .empty-state h3 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 19px;

            letter-spacing: -0.5px;
        }


        .empty-state p {
            max-width: 430px;

            margin: 8px auto 0;

            color: var(--muted);

            font-size: 11px;

            line-height: 1.55;
        }


        .view-all-btn {
            min-height: 39px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            margin-top: 17px;

            padding: 0 15px;

            border-radius: 9px;

            background: var(--ink);

            color: white;

            font-size: 9px;
            font-weight: 700;

            transition: 0.22s ease;
        }


        .view-all-btn:hover {
            background: #263a35;

            transform: translateY(-1px);
        }


        /* =========================================
           ANIMATIONS
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


        .job-card:nth-child(2) {
            animation-delay: 0.04s;
        }


        .job-card:nth-child(3) {
            animation-delay: 0.08s;
        }


        .job-card:nth-child(4) {
            animation-delay: 0.12s;
        }


        .job-card:nth-child(5) {
            animation-delay: 0.16s;
        }


        .job-card:nth-child(6) {
            animation-delay: 0.20s;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 1050px) {

            .vj-grid {
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


            .topbar h1 {
                font-size: 20px;
            }

        }


        @media (max-width: 680px) {

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
            }


            .topbar-right {
                display: none;
            }


            .vj-search-section {
                padding: 19px;
            }


            .search-box {
                align-items: stretch;

                flex-direction: column;
            }


            .search-bar {
                max-width: none;

                width: 100%;
            }


            .search-btn,
            .refresh-btn {
                width: 100%;
            }

        }


        @media (max-width: 450px) {

            .sidebar-nav {
                grid-template-columns: 1fr;
            }


            .topbar h1 {
                font-size: 19px;
            }


            .job-card {
                padding: 18px;
            }


            .job-card-meta {
                flex-direction: column;
            }


            .job-card-meta span {
                width: 100%;
            }


            .job-action-btns {
                grid-template-columns: 1fr;
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


        <a
            href="${pageContext.request.contextPath}/user-dashboard.jsp">

            <i class="fa-solid fa-gauge"></i>

            <span>Dashboard</span>

        </a>


        <a
            href="${pageContext.request.contextPath}/viewjob"
            class="active">

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


            <a
                href="${pageContext.request.contextPath}/user-dashboard.jsp"
                class="back-btn">

                <i class="fa-solid fa-arrow-left"></i>

            </a>


            <h1>
                Browse Jobs
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
         SEARCH
    ========================================= -->

    <div class="vj-search-section">


        <div class="search-heading">

            <h2>
                Find your next opportunity
            </h2>

            <p>
                Search through available roles and discover your next career move.
            </p>

        </div>


        <form
            action="${pageContext.request.contextPath}/viewjob"
            class="search-box"
            method="get">


            <div class="search-bar">


                <i class="fa-solid fa-magnifying-glass"></i>


                <input
                    type="text"
                    name="search"
                    data-smart-search="role"
                    placeholder="Search jobs by title, skill, or keyword...">


            </div>


            <input
                type="submit"
                value="Search"
                class="search-btn">


            <a
                href="${pageContext.request.contextPath}/viewjob"
                class="refresh-btn">

                <i class="fa-solid fa-rotate-right"></i>

                Refresh

            </a>


        </form>


        <p class="vj-subtitle">

            Find the perfect opportunity for your career.

        </p>


    </div>


    <!-- =========================================
         JOB RESULTS
    ========================================= -->

    <div class="vj-content">


        <c:if test="${empty jobs}">


            <div class="empty-state">


                <div class="empty-icon">

                    <i class="fa-solid fa-briefcase"></i>

                </div>


                <h3>
                    No Jobs Found
                </h3>


                <p>
                    We couldn't find any jobs matching your search.
                    Try a different keyword or check back later.
                </p>


                <a
                    href="${pageContext.request.contextPath}/viewjob"
                    class="view-all-btn">

                    View All Jobs

                </a>


            </div>


        </c:if>


        <c:if test="${not empty jobs}">


            <div class="results-heading">

                <h3>
                    Available Opportunities
                </h3>

                <span>
                    ${jobs.size()} Jobs
                </span>

            </div>


            <div class="vj-grid">


                <c:forEach
                    var="job"
                    items="${jobs}">


                    <div class="job-card">


                        <!-- JOB HEADER -->

                        <div class="job-card-header">


                            <div class="job-logo">

                                <i class="fa-solid fa-building"></i>

                            </div>


                            <div class="job-title-area">


                                <h2>
                                    ${job.title}
                                </h2>


                                <p class="job-card-company">
                                    Company &bull; Hiring Now
                                </p>


                                <span class="hiring-badge">

                                    <i class="fa-solid fa-circle"></i>

                                    Open Position

                                </span>


                            </div>


                        </div>


                        <!-- JOB META -->

                        <div class="job-card-meta">


                            <span>

                                <i class="fa-solid fa-location-dot"></i>

                                ${job.location}

                            </span>


                            <span>

                                <i class="fa-solid fa-indian-rupee-sign"></i>

                                ${job.salary}

                            </span>


                            <span>

                                <i class="fa-solid fa-calendar-days"></i>

                                Closes: ${job.lastDate}

                            </span>


                        </div>


                        <!-- DESCRIPTION -->

                        <p class="job-desc-text">

                            <strong>
                                Description:
                            </strong>

                            ${job.description}

                        </p>


                        <!-- ACTION -->

                        <div class="job-action">


                            <c:set
                                var="today"
                                value="<%= java.time.LocalDate.now() %>" />


                            <c:choose>


                                <c:when
                                    test="${today.toString().compareTo(job.lastDate) <= 0}">


                                    <div class="job-action-btns">


                                        <form
                                            action="${pageContext.request.contextPath}/applyjob"
                                            method="post">


                                            <input
                                                type="hidden"
                                                name="jobId"
                                                value="${job.id}">


                                            <input
                                                type="submit"
                                                value="Apply Now"
                                                class="apply-btn">

                                        </form>


                                        <a
                                            href="${pageContext.request.contextPath}/savejob?jobid=${job.id}"
                                            class="save-job-btn">

                                            <i class="fa-solid fa-heart"></i>

                                            Save Job

                                        </a>


                                    </div>


                                </c:when>


                                <c:otherwise>


                                    <div class="closed-job">

                                        <i class="fa-solid fa-circle-xmark"></i>

                                        Application Closed

                                    </div>


                                </c:otherwise>


                            </c:choose>


                            <!-- ERROR MESSAGE -->

                            <c:if
                                test="${not empty errorJobId and errorJobId == job.id}">


                                <p class="error-msg">

                                    <i class="fa-solid fa-triangle-exclamation"></i>

                                    ${error}

                                </p>


                            </c:if>


                        </div>


                    </div>


                </c:forEach>


            </div>


        </c:if>


    </div>


</div>


<script
    src="${pageContext.request.contextPath}/js/smart-search.js">
</script>


</body>

</html>