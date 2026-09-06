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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Rejected Candidates | SMARTHIRE</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

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
            --danger: #c95d4e;
            --danger-soft: #fae9e5;
            --shadow: 0 18px 45px rgba(19, 33, 30, 0.08);
        }


        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
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


        button {
            font-family: inherit;
        }


        /* =====================================
           SIDEBAR
        ===================================== */

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


        .logout-link {
            color: #e5aaa0 !important;
        }


        .logout-link:hover {
            background: rgba(242, 121, 97, 0.10) !important;

            color: #ffb2a4 !important;
        }


        /* =====================================
           MAIN CONTENT
        ===================================== */

        .main-content {
            margin-left: 250px;

            min-height: 100vh;

            padding: 0 38px 50px;
        }


        /* =====================================
           TOPBAR
        ===================================== */

        .topbar {
            min-height: 82px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            gap: 20px;

            border-bottom: 1px solid var(--line);
        }


        .topbar-left h1 {
            display: flex;
            align-items: center;

            gap: 10px;

            font-family: "Space Grotesk", sans-serif;

            font-size: 22px;

            letter-spacing: -0.7px;
        }


        .heading-icon {
            color: var(--coral);

            font-size: 19px;
        }


        .dashboard-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;

            min-height: 39px;

            padding: 0 14px;

            border: 1px solid var(--line);

            border-radius: 9px;

            background: rgba(255, 255, 255, 0.65);

            color: var(--ink);

            font-size: 12px;
            font-weight: 700;

            transition: 0.25s ease;
        }


        .dashboard-btn:hover {
            background: white;

            border-color: #b9c3ba;

            transform: translateY(-2px);
        }


        /* =====================================
           COUNT BANNER
        ===================================== */

        .count-banner {
            position: relative;

            display: flex;
            align-items: center;

            gap: 16px;

            margin-top: 28px;

            padding: 21px 24px;

            overflow: hidden;

            border-radius: 17px;

            background: white;

            border: 1px solid var(--line);

            box-shadow: 0 10px 25px rgba(19, 33, 30, 0.04);

            animation: fadeUp 0.5s ease both;
        }


        .count-banner::after {
            content: "";

            position: absolute;

            width: 150px;
            height: 150px;

            border-radius: 50%;

            border: 1px solid #f0d7d1;

            right: -55px;
            top: -85px;
        }


        .rj-count-icon {
            width: 47px;
            height: 47px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 13px;

            background: var(--danger-soft);

            color: var(--danger);

            font-size: 17px;
        }


        .count-num {
            font-family: "Space Grotesk", sans-serif;

            font-size: 26px;
            font-weight: 700;

            letter-spacing: -0.8px;
        }


        .count-label {
            margin-top: 2px;

            color: var(--muted);

            font-size: 11px;
            font-weight: 500;
        }


        /* =====================================
           CONTENT
        ===================================== */

        .rj-content {
            margin-top: 20px;
        }


        /* =====================================
           CANDIDATE GRID
        ===================================== */

        .candidate-container {
            display: grid;

            grid-template-columns:
                repeat(3, minmax(0, 1fr));

            gap: 17px;
        }


        /* =====================================
           CANDIDATE CARD
        ===================================== */

        .candidate-card {
            position: relative;

            overflow: hidden;

            background: white;

            border: 1px solid var(--line);

            border-radius: 17px;

            transition:
                transform 0.28s ease,
                box-shadow 0.28s ease,
                border-color 0.28s ease;

            animation: fadeUp 0.55s ease both;
        }


        .candidate-card:hover {
            transform: translateY(-5px);

            border-color: #c5cec5;

            box-shadow:
                0 16px 35px rgba(19, 33, 30, 0.09);
        }


        .candidate-card::before {
            content: "";

            position: absolute;

            left: 0;
            top: 0;

            width: 100%;
            height: 3px;

            background: var(--coral);

            opacity: 0.75;
        }


        /* =====================================
           CARD HEADER
        ===================================== */

        .card-header {
            display: flex;
            align-items: center;

            gap: 13px;

            padding: 22px 20px 17px;
        }


        .avatar {
            width: 48px;
            height: 48px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 13px;

            background: var(--soft);

            color: var(--ink);

            font-size: 17px;
        }


        .candidate-name {
            color: var(--ink);

            font-family: "Space Grotesk", sans-serif;

            font-size: 16px;

            letter-spacing: -0.4px;

            line-height: 1.2;

            overflow: hidden;

            text-overflow: ellipsis;

            white-space: nowrap;
        }


        .rejected-status {
            display: inline-flex;
            align-items: center;

            margin-top: 6px;

            padding: 4px 8px;

            border-radius: 50px;

            background: var(--danger-soft);

            color: var(--danger);

            font-size: 9px;
            font-weight: 700;

            letter-spacing: 0.5px;
        }


        /* =====================================
           CARD BODY
        ===================================== */

        .card-body {
            padding: 0 20px 18px;
        }


        .candidate-detail {
            display: flex;
            align-items: flex-start;

            gap: 10px;

            padding: 8px 0;

            color: #647169;

            font-size: 11px;

            border-top: 1px solid #edf0eb;
        }


        .candidate-detail i {
            width: 15px;

            flex-shrink: 0;

            color: var(--coral);

            font-size: 11px;

            text-align: center;

            margin-top: 1px;
        }


        .candidate-detail span {
            overflow-wrap: anywhere;
        }


        /* =====================================
           CARD ACTIONS
        ===================================== */

        .card-actions {
            display: flex;

            align-items: center;

            gap: 8px;

            padding: 14px 20px;

            border-top: 1px solid #edf0eb;

            background: #fafbf8;
        }


        .profile-btn,
        .restore-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 6px;

            min-height: 35px;

            padding: 0 11px;

            border-radius: 8px;

            font-size: 10px;
            font-weight: 700;

            transition: 0.22s ease;
        }


        .profile-btn {
            border: 1px solid var(--line);

            background: white;

            color: var(--ink);
        }


        .profile-btn:hover {
            border-color: var(--ink);

            transform: translateY(-1px);
        }


        .restore-btn {
            flex: 1;

            border: 1px solid transparent;

            background: var(--ink);

            color: white;
        }


        .restore-btn:hover {
            background: #20332f;

            transform: translateY(-1px);

            box-shadow: 0 6px 14px rgba(19, 33, 30, 0.12);
        }


        /* =====================================
           EMPTY STATE
        ===================================== */

        .empty-state {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;

            min-height: 330px;

            padding: 40px 20px;

            border: 1px dashed #cbd4ca;

            border-radius: 18px;

            background: rgba(255, 255, 255, 0.55);

            text-align: center;

            animation: fadeUp 0.5s ease both;
        }


        .empty-state > i {
            width: 58px;
            height: 58px;

            display: flex;
            align-items: center;
            justify-content: center;

            margin-bottom: 16px;

            border-radius: 17px;

            background: var(--danger-soft);

            color: var(--danger);

            font-size: 20px;
        }


        .empty-state h3 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 19px;

            letter-spacing: -0.5px;
        }


        .empty-state p {
            margin-top: 7px;

            color: var(--muted);

            font-size: 12px;
        }


        /* =====================================
           ANIMATION
        ===================================== */

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


        /* =====================================
           RESPONSIVE
        ===================================== */

        @media (max-width: 1100px) {

            .main-content {
                padding-left: 27px;
                padding-right: 27px;
            }


            .candidate-container {
                grid-template-columns:
                    repeat(2, minmax(0, 1fr));
            }

        }


        @media (max-width: 800px) {

            .sidebar {
                width: 215px;
            }


            .main-content {
                margin-left: 215px;
            }


            .candidate-container {
                grid-template-columns: 1fr;
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

                padding: 0 15px 35px;
            }


            .topbar {
                min-height: 72px;

                align-items: flex-start;

                flex-direction: column;

                justify-content: center;

                gap: 9px;
            }


            .topbar-left h1 {
                font-size: 19px;
            }


            .dashboard-btn {
                min-height: 35px;
            }

        }


        @media (max-width: 450px) {

            .sidebar-nav {
                grid-template-columns: 1fr;
            }


            .count-banner {
                padding: 18px;
            }


            .card-header {
                padding-left: 17px;
                padding-right: 17px;
            }


            .card-body {
                padding-left: 17px;
                padding-right: 17px;
            }


            .card-actions {
                padding-left: 17px;
                padding-right: 17px;
            }


            .profile-btn,
            .restore-btn {
                font-size: 9px;
            }

        }

    </style>

</head>


<body>


<!-- =====================================
     SIDEBAR
===================================== -->

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


        <a href="${pageContext.request.contextPath}/shortlistedcandidates">

            <i class="fa-solid fa-star"></i>

            <span>Shortlisted</span>

        </a>


        <a href="${pageContext.request.contextPath}/rejectedcandidates"
           class="active">

            <i class="fa-solid fa-circle-xmark"></i>

            <span>Rejected</span>

        </a>


        <a href="${pageContext.request.contextPath}/logout"
           class="logout-link">

            <i class="fa-solid fa-right-from-bracket"></i>

            <span>Logout</span>

        </a>


    </nav>

</div>


<!-- =====================================
     MAIN
===================================== -->

<div class="main-content">


    <!-- TOPBAR -->

    <div class="topbar">


        <div class="topbar-left">

            <h1>

                <i class="fa-solid fa-circle-xmark heading-icon"></i>

                Rejected Candidates

            </h1>

        </div>


        <div class="topbar-right">

            <a href="${pageContext.request.contextPath}/recruiter-dashboard.jsp"
               class="dashboard-btn">

                <i class="fa-solid fa-arrow-left"></i>

                Dashboard

            </a>

        </div>

    </div>


    <!-- =====================================
         COUNT
    ===================================== -->

    <div class="count-banner">

        <div class="rj-count-icon">

            <i class="fa-solid fa-circle-xmark"></i>

        </div>


        <div>

            <div class="count-num">
                ${rejected.size()}
            </div>

            <div class="count-label">
                Rejected Candidates
            </div>

        </div>

    </div>


    <!-- =====================================
         CONTENT
    ===================================== -->

    <div class="rj-content">


        <!-- EMPTY STATE -->

        <c:if test="${empty rejected}">

            <div class="empty-state">

                <i class="fa-solid fa-circle-xmark"></i>

                <h3>
                    No Rejected Candidates
                </h3>

                <p>
                    No candidates have been rejected yet.
                </p>

            </div>

        </c:if>


        <!-- CANDIDATES -->

        <c:if test="${not empty rejected}">

            <div class="candidate-container">


                <c:forEach var="app" items="${rejected}">


                    <div class="candidate-card">


                        <!-- CARD HEADER -->

                        <div class="card-header">


                            <div class="avatar">

                                <i class="fa-solid fa-user"></i>

                            </div>


                            <div style="min-width:0;">

                                <h2 class="candidate-name">

                                    ${app.user.name}

                                </h2>


                                <span class="rejected-status">

                                    <i class="fa-solid fa-xmark"
                                       style="margin-right:4px;"></i>

                                    REJECTED

                                </span>

                            </div>

                        </div>


                        <!-- CARD BODY -->

                        <div class="card-body">


                            <p class="candidate-detail">

                                <i class="fa-solid fa-envelope"></i>

                                <span>
                                    ${app.user.email}
                                </span>

                            </p>


                            <p class="candidate-detail">

                                <i class="fa-solid fa-briefcase"></i>

                                <span>
                                    ${app.job.title}
                                </span>

                            </p>


                            <p class="candidate-detail">

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
                                class="profile-btn">

                                <i class="fa-solid fa-user"></i>

                                View Profile

                            </a>


                            <a
                                href="${pageContext.request.contextPath}/shortlistcandidate?userId=${app.user.id}&amp;jobId=${app.job.id}"
                                class="restore-btn">

                                <i class="fa-solid fa-rotate-left"></i>

                                Move To Shortlist

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