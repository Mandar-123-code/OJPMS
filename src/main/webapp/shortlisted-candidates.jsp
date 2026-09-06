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

    <title>Shortlisted Candidates | SMARTHIRE</title>


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

            --gold: #b7791f;
            --gold-soft: #fff7df;

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
            text-decoration: none;

            color: inherit;
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


        .logout-link {
            margin-top: 5px;

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

            border-bottom: 1px solid var(--line);

            gap: 20px;
        }


        .topbar-left h1 {
            display: flex;
            align-items: center;

            gap: 10px;

            font-family: "Space Grotesk", sans-serif;

            font-size: 23px;

            letter-spacing: -0.8px;
        }


        .heading-icon {
            color: var(--gold);

            font-size: 19px;
        }


        .dashboard-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;

            min-height: 38px;

            padding: 0 14px;

            border: 1px solid var(--line);

            border-radius: 9px;

            background: white;

            color: #53615b;

            font-size: 10px;
            font-weight: 700;

            transition: 0.22s ease;
        }


        .dashboard-btn:hover {
            border-color: #aebbb2;

            color: var(--ink);

            transform: translateY(-1px);
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

            padding: 22px 25px;

            overflow: hidden;

            border: 1px solid #eadfbe;

            border-radius: 16px;

            background:
                linear-gradient(
                    135deg,
                    #fffdf6,
                    #fff8e7
                );

            animation: fadeUp 0.5s ease both;
        }


        .count-banner::after {
            content: "";

            position: absolute;

            width: 180px;
            height: 180px;

            right: -65px;
            top: -100px;

            border: 1px solid #eadfbe;

            border-radius: 50%;
        }


        .sl-count-icon {
            width: 50px;
            height: 50px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 14px;

            background: var(--gold);

            color: white;

            font-size: 18px;

            box-shadow:
                0 8px 18px rgba(183, 121, 31, 0.18);
        }


        .count-num {
            font-family: "Space Grotesk", sans-serif;

            font-size: 27px;
            font-weight: 700;

            line-height: 1;
        }


        .count-label {
            margin-top: 5px;

            color: #766c56;

            font-size: 11px;
            font-weight: 500;
        }


        /* =========================================
           CONTENT
        ========================================= */

        .sl-content {
            margin-top: 22px;
        }


        /* =========================================
           CANDIDATE GRID
        ========================================= */

        .candidate-container {
            display: grid;

            grid-template-columns:
                repeat(3, minmax(0, 1fr));

            gap: 17px;
        }


        /* =========================================
           CANDIDATE CARD
        ========================================= */

        .candidate-card {
            position: relative;

            display: flex;
            flex-direction: column;

            min-width: 0;

            padding: 21px;

            border: 1px solid var(--line);

            border-radius: 16px;

            background: white;

            box-shadow:
                0 8px 25px rgba(19, 33, 30, 0.04);

            overflow: hidden;

            animation: fadeUp 0.55s ease both;

            transition:
                transform 0.25s ease,
                box-shadow 0.25s ease,
                border-color 0.25s ease;
        }


        .candidate-card::before {
            content: "";

            position: absolute;

            left: 0;
            top: 0;

            width: 100%;
            height: 3px;

            background: var(--gold);
        }


        .candidate-card:hover {
            transform: translateY(-5px);

            border-color: #cbd3ca;

            box-shadow: var(--shadow);
        }


        /* =========================================
           CARD HEADER
        ========================================= */

        .card-header {
            display: flex;
            align-items: center;

            gap: 13px;

            padding-bottom: 17px;

            border-bottom: 1px solid #edf0eb;
        }


        .avatar {
            width: 45px;
            height: 45px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 13px;

            background: #edf0e7;

            color: var(--ink);

            font-size: 15px;
        }


        .candidate-name {
            min-width: 0;

            font-family: "Space Grotesk", sans-serif;

            font-size: 15px;
            font-weight: 700;

            white-space: nowrap;

            overflow: hidden;

            text-overflow: ellipsis;
        }


        .status {
            display: inline-flex;
            align-items: center;

            gap: 5px;

            margin-top: 5px;

            padding: 4px 8px;

            border-radius: 6px;

            background: var(--gold-soft);

            color: var(--gold);

            font-size: 8px;
            font-weight: 800;

            letter-spacing: 0.5px;
        }


        /* =========================================
           CARD BODY
        ========================================= */

        .card-body {
            display: flex;
            flex-direction: column;

            gap: 12px;

            padding: 18px 0;
        }


        .card-body p {
            display: flex;
            align-items: flex-start;

            gap: 10px;

            color: #66736d;

            font-size: 11px;

            line-height: 1.4;
        }


        .card-body p i {
            width: 15px;

            margin-top: 1px;

            flex-shrink: 0;

            color: #87938d;

            font-size: 10px;

            text-align: center;
        }


        .card-body p:nth-child(2) i {
            color: var(--gold);
        }


        /* =========================================
           ACTIONS
        ========================================= */

        .card-actions {
            display: grid;

            grid-template-columns: 1fr 1.45fr;

            gap: 8px;

            margin-top: auto;

            padding-top: 2px;
        }


        .action-btn {
            min-height: 39px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 6px;

            padding: 0 9px;

            border-radius: 9px;

            font-size: 9px;
            font-weight: 700;

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                background 0.2s ease;
        }


        .profile-btn {
            border: 1px solid var(--line);

            background: #fafbf8;

            color: #56645e;
        }


        .profile-btn:hover {
            background: #f0f3ed;

            color: var(--ink);

            transform: translateY(-1px);
        }


        .interview-btn {
            border: 1px solid var(--ink);

            background: var(--ink);

            color: white;
        }


        .interview-btn:hover {
            background: #263a35;

            box-shadow:
                0 7px 15px rgba(19, 33, 30, 0.13);

            transform: translateY(-1px);
        }


        /* =========================================
           EMPTY STATE
        ========================================= */

        .empty-state {
            max-width: 570px;

            margin: 0 auto;

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
            width: 60px;
            height: 60px;

            display: flex;
            align-items: center;
            justify-content: center;

            margin: 0 auto 17px;

            border-radius: 17px;

            background: var(--gold-soft);

            color: var(--gold);

            font-size: 22px;
        }


        .empty-state h3 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 19px;

            letter-spacing: -0.5px;
        }


        .empty-state p {
            margin-top: 7px;

            color: var(--muted);

            font-size: 11px;
        }


        .posted-jobs-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;

            min-height: 40px;

            margin-top: 18px;

            padding: 0 15px;

            border-radius: 9px;

            background: var(--ink);

            color: white;

            font-size: 10px;
            font-weight: 700;

            transition: 0.2s ease;
        }


        .posted-jobs-btn:hover {
            background: #263a35;

            transform: translateY(-2px);
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


        .candidate-card:nth-child(2) {
            animation-delay: 0.04s;
        }


        .candidate-card:nth-child(3) {
            animation-delay: 0.08s;
        }


        .candidate-card:nth-child(4) {
            animation-delay: 0.12s;
        }


        .candidate-card:nth-child(5) {
            animation-delay: 0.16s;
        }


        .candidate-card:nth-child(6) {
            animation-delay: 0.20s;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 1100px) {

            .candidate-container {
                grid-template-columns:
                    repeat(2, minmax(0, 1fr));
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


            .topbar-left h1 {
                font-size: 20px;
            }

        }


        @media (max-width: 680px) {

            .candidate-container {
                grid-template-columns: 1fr;
            }


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


            .count-banner {
                margin-top: 20px;

                padding: 19px;
            }

        }


        @media (max-width: 450px) {

            .sidebar-nav {
                grid-template-columns: 1fr;
            }


            .topbar-left h1 {
                font-size: 19px;
            }


            .candidate-card {
                padding: 18px;
            }


            .card-actions {
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
                Recruiter Portal
            </span>

        </div>


    </div>


    <nav class="sidebar-nav">


        <a href="${pageContext.request.contextPath}/recruiter-dashboard.jsp">

            <i class="fa-solid fa-gauge"></i>

            <span>Dashboard</span>

        </a>


        <a href="${pageContext.request.contextPath}/postedjobs">

            <i class="fa-solid fa-list-ul"></i>

            <span>My Jobs</span>

        </a>


        <a
            href="${pageContext.request.contextPath}/shortlistedcandidates"
            class="active">

            <i class="fa-solid fa-star"></i>

            <span>Shortlisted</span>

        </a>


        <a href="${pageContext.request.contextPath}/rejectedcandidates">

            <i class="fa-solid fa-circle-xmark"></i>

            <span>Rejected</span>

        </a>


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

                <i class="fa-solid fa-star heading-icon"></i>

                Shortlisted Candidates

            </h1>

        </div>


        <div class="topbar-right">

            <a
                href="${pageContext.request.contextPath}/recruiter-dashboard.jsp"
                class="dashboard-btn">

                <i class="fa-solid fa-arrow-left"
                   style="margin-right:6px;"></i>

                Dashboard

            </a>

        </div>


    </div>


    <!-- =========================================
         COUNT
    ========================================= -->

    <div class="count-banner">


        <div class="sl-count-icon">

            <i class="fa-solid fa-star"></i>

        </div>


        <div>

            <div class="count-num">

                ${shortlisted.size()}

            </div>


            <div class="count-label">

                Shortlisted Candidates

            </div>

        </div>


    </div>


    <!-- =========================================
         CONTENT
    ========================================= -->

    <div class="sl-content">


        <!-- EMPTY STATE -->

        <c:if test="${empty shortlisted}">


            <div class="empty-state">


                <div class="empty-icon">

                    <i class="fa-solid fa-star"></i>

                </div>


                <h3>
                    No Shortlisted Candidates
                </h3>


                <p>
                    Go to your job applicants and shortlist
                    candidates you want to move forward.
                </p>


                <a
                    href="${pageContext.request.contextPath}/postedjobs"
                    class="posted-jobs-btn">

                    <i class="fa-solid fa-list-ul"
                       style="margin-right:7px;"></i>

                    View Posted Jobs

                </a>


            </div>


        </c:if>


        <!-- CANDIDATES -->

        <c:if test="${not empty shortlisted}">


            <div class="candidate-container">


                <c:forEach
                    var="app"
                    items="${shortlisted}">


                    <div class="candidate-card">


                        <!-- HEADER -->

                        <div class="card-header">


                            <div class="avatar">

                                <i class="fa-solid fa-user"></i>

                            </div>


                            <div style="flex:1; min-width:0;">


                                <h2 class="candidate-name">

                                    ${app.user.name}

                                </h2>


                                <span class="status">

                                    <i class="fa-solid fa-star"></i>

                                    SHORTLISTED

                                </span>


                            </div>


                        </div>


                        <!-- BODY -->

                        <div class="card-body">


                            <p>

                                <i class="fa-solid fa-envelope"></i>

                                <span>
                                    ${app.user.email}
                                </span>

                            </p>


                            <p>

                                <i class="fa-solid fa-briefcase"></i>

                                <span>
                                    ${app.job.title}
                                </span>

                            </p>


                            <p>

                                <i class="fa-solid fa-location-dot"></i>

                                <span>
                                    ${app.job.location}
                                </span>

                            </p>


                        </div>


                        <!-- ACTIONS -->

                        <div class="card-actions">


                            <a
                                href="${pageContext.request.contextPath}/recruiterprofile?id=${app.user.id}"
                                class="action-btn profile-btn">

                                <i class="fa-solid fa-user"></i>

                                View Profile

                            </a>


                            <a
                                href="${pageContext.request.contextPath}/scheduleinterviewpage?userId=${app.user.id}&amp;jobId=${app.job.id}"
                                class="action-btn interview-btn">

                                <i class="fa-solid fa-calendar-days"></i>

                                Schedule Interview

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