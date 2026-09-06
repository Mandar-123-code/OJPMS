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

    <title>Applicants Dashboard | SMARTHIRE</title>


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
            --blue-soft: #eaf1f5;

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


        .logout-link {
            margin-top: 5px;

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

            min-width: 0;
        }


        .va-back-btn {
            width: 38px;
            height: 38px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border: 1px solid var(--line);

            border-radius: 9px;

            background: white;

            color: #63716a;

            font-size: 11px;

            transition: 0.22s ease;
        }


        .va-back-btn:hover {
            color: var(--ink);

            border-color: #aebbb2;

            transform: translateX(-2px);
        }


        .page-heading h1 {
            display: flex;
            align-items: center;

            gap: 9px;

            font-family: "Space Grotesk", sans-serif;

            font-size: 22px;

            letter-spacing: -0.7px;
        }


        .page-heading h1 i {
            color: var(--blue);

            font-size: 17px;
        }


        .job-name {
            margin-top: 3px;

            max-width: 500px;

            overflow: hidden;

            color: var(--muted);

            font-size: 10px;

            white-space: nowrap;

            text-overflow: ellipsis;
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

            border: 1px solid #d5e0e6;

            border-radius: 16px;

            background:
                linear-gradient(
                    135deg,
                    #fbfdfd,
                    #eef4f7
                );

            animation: fadeUp 0.5s ease both;
        }


        .count-banner::after {
            content: "";

            position: absolute;

            width: 190px;
            height: 190px;

            right: -75px;
            top: -110px;

            border: 1px solid #d8e2e7;

            border-radius: 50%;
        }


        .va-count-icon {
            width: 50px;
            height: 50px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 14px;

            background: var(--blue);

            color: white;

            font-size: 17px;

            box-shadow:
                0 8px 18px rgba(82, 127, 158, 0.17);
        }


        .count-num {
            font-family: "Space Grotesk", sans-serif;

            font-size: 27px;
            font-weight: 700;

            line-height: 1;
        }


        .count-label {
            margin-top: 5px;

            color: #65747d;

            font-size: 11px;
        }


        /* =========================================
           CONTENT
        ========================================= */

        .va-content {
            margin-top: 22px;
        }


        /* =========================================
           APPLICANT GRID
        ========================================= */

        .applicants-container {
            display: grid;

            grid-template-columns:
                repeat(3, minmax(0, 1fr));

            gap: 17px;
        }


        /* =========================================
           APPLICANT CARD
        ========================================= */

        .applicant-card {
            position: relative;

            display: flex;
            flex-direction: column;

            min-width: 0;

            padding: 21px;

            overflow: hidden;

            border: 1px solid var(--line);

            border-radius: 16px;

            background: white;

            box-shadow:
                0 8px 25px rgba(19, 33, 30, 0.04);

            animation: fadeUp 0.55s ease both;

            transition:
                transform 0.25s ease,
                box-shadow 0.25s ease,
                border-color 0.25s ease;
        }


        .applicant-card::before {
            content: "";

            position: absolute;

            top: 0;
            left: 0;

            width: 100%;
            height: 3px;

            background: var(--blue);
        }


        .applicant-card:hover {
            transform: translateY(-5px);

            border-color: #c5d0d5;

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


        .profile-circle {
            width: 46px;
            height: 46px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 13px;

            background: var(--blue-soft);

            color: var(--blue);

            font-size: 15px;
        }


        .candidate-info {
            flex: 1;

            min-width: 0;
        }


        .candidate-name {
            overflow: hidden;

            font-family: "Space Grotesk", sans-serif;

            font-size: 15px;
            font-weight: 700;

            letter-spacing: -0.3px;

            white-space: nowrap;

            text-overflow: ellipsis;
        }


        .status {
            display: inline-flex;
            align-items: center;

            gap: 5px;

            margin-top: 5px;

            padding: 4px 8px;

            border-radius: 6px;

            background: var(--blue-soft);

            color: var(--blue);

            font-size: 8px;
            font-weight: 800;

            letter-spacing: 0.4px;

            text-transform: uppercase;
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


        .candidate-detail {
            display: flex;
            align-items: flex-start;

            gap: 10px;

            color: #66736d;

            font-size: 10px;

            line-height: 1.45;
        }


        .candidate-detail i {
            width: 15px;

            margin-top: 1px;

            flex-shrink: 0;

            color: #89958f;

            font-size: 10px;

            text-align: center;
        }


        .candidate-detail strong {
            color: #435149;

            font-weight: 700;
        }


        .candidate-detail span {
            overflow-wrap: anywhere;
        }


        /* =========================================
           ACTIONS
        ========================================= */

        .card-actions {
            display: grid;

            grid-template-columns:
                1fr 1fr 1fr;

            gap: 7px;

            margin-top: auto;

            padding-top: 2px;
        }


        .action-btn {
            min-height: 38px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 5px;

            padding: 0 7px;

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

            color: #53615b;
        }


        .profile-btn:hover {
            background: #f0f3ed;

            color: var(--ink);

            transform: translateY(-1px);
        }


        .shortlist-btn {
            border: 1px solid #c8dfd0;

            background: var(--green-soft);

            color: var(--green);
        }


        .shortlist-btn:hover {
            background: #e3f2e8;

            box-shadow:
                0 7px 15px rgba(61, 118, 91, 0.10);

            transform: translateY(-1px);
        }


        .reject-btn {
            border: 1px solid #f0d0cb;

            background: var(--red-soft);

            color: var(--red);
        }


        .reject-btn:hover {
            background: #ffe5e0;

            box-shadow:
                0 7px 15px rgba(184, 92, 81, 0.08);

            transform: translateY(-1px);
        }


        /* =========================================
           EMPTY STATE
        ========================================= */

        .empty-state {
            max-width: 590px;

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
            width: 61px;
            height: 61px;

            display: flex;
            align-items: center;
            justify-content: center;

            margin: 0 auto 17px;

            border-radius: 17px;

            background: var(--blue-soft);

            color: var(--blue);

            font-size: 22px;
        }


        .empty-state h3 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 19px;

            letter-spacing: -0.5px;
        }


        .empty-state p {
            max-width: 440px;

            margin: 8px auto 0;

            color: var(--muted);

            font-size: 11px;

            line-height: 1.55;
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


        .applicant-card:nth-child(2) {
            animation-delay: 0.04s;
        }


        .applicant-card:nth-child(3) {
            animation-delay: 0.08s;
        }


        .applicant-card:nth-child(4) {
            animation-delay: 0.12s;
        }


        .applicant-card:nth-child(5) {
            animation-delay: 0.16s;
        }


        .applicant-card:nth-child(6) {
            animation-delay: 0.20s;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 1100px) {

            .applicants-container {
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


            .page-heading h1 {
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


            .count-banner {
                margin-top: 20px;

                padding: 19px;
            }


            .applicants-container {
                grid-template-columns: 1fr;
            }

        }


        @media (max-width: 450px) {

            .sidebar-nav {
                grid-template-columns: 1fr;
            }


            .page-heading h1 {
                font-size: 19px;
            }


            .job-name {
                max-width: 230px;
            }


            .applicant-card {
                padding: 18px;
            }


            .card-actions {
                grid-template-columns: 1fr;
            }


            .action-btn {
                min-height: 40px;
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


        <a
            href="${pageContext.request.contextPath}/recruiter-dashboard.jsp">

            <i class="fa-solid fa-gauge"></i>

            <span>Dashboard</span>

        </a>


        <a
            href="${pageContext.request.contextPath}/postedjobs"
            class="active">

            <i class="fa-solid fa-list-ul"></i>

            <span>My Jobs</span>

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
     MAIN
========================================= -->

<div class="main-content">


    <!-- TOPBAR -->

    <div class="topbar">


        <div class="topbar-left">


            <a
                href="${pageContext.request.contextPath}/postedjobs"
                class="va-back-btn">

                <i class="fa-solid fa-arrow-left"></i>

            </a>


            <div class="page-heading">


                <h1>

                    <i class="fa-solid fa-user-group"></i>

                    Applicants Dashboard

                </h1>


                <p class="job-name">

                    ${job.title}

                </p>


            </div>


        </div>


        <div class="topbar-right">


            <a
                href="${pageContext.request.contextPath}/postedjobs"
                class="topbar-btn">

                <i class="fa-solid fa-arrow-left"></i>

                Back

            </a>


        </div>


    </div>


    <!-- =========================================
         COUNT BANNER
    ========================================= -->

    <div class="count-banner">


        <div class="va-count-icon">

            <i class="fa-solid fa-users"></i>

        </div>


        <div>


            <div class="count-num">

                ${applicants.size()}

            </div>


            <div class="count-label">

                Total Applications

            </div>


        </div>


    </div>


    <!-- =========================================
         APPLICANTS
    ========================================= -->

    <div class="va-content">


        <!-- EMPTY STATE -->

        <c:if test="${empty applicants}">


            <div class="empty-state">


                <div class="empty-icon">

                    <i class="fa-solid fa-user-slash"></i>

                </div>


                <h3>
                    No Applicants Yet
                </h3>


                <p>
                    No one has applied for this job yet.
                    Share the job listing to attract
                    qualified candidates.
                </p>


            </div>


        </c:if>


        <!-- APPLICANT CARDS -->

        <c:if test="${not empty applicants}">


            <div class="applicants-container">


                <c:forEach
                    var="user"
                    items="${applicants}">


                    <div class="applicant-card">


                        <!-- HEADER -->

                        <div class="card-header">


                            <div class="profile-circle">

                                <i class="fa-solid fa-user"></i>

                            </div>


                            <div class="candidate-info">


                                <h2 class="candidate-name">

                                    ${user.name}

                                </h2>


                                <span class="status">

                                    <i class="fa-solid fa-circle-check"></i>

                                    Applied

                                </span>


                            </div>


                        </div>


                        <!-- DETAILS -->

                        <div class="card-body">


                            <p class="candidate-detail">

                                <i class="fa-solid fa-envelope"></i>

                                <span>
                                    ${user.email}
                                </span>

                            </p>


                            <p class="candidate-detail">

                                <i class="fa-solid fa-user-tag"></i>

                                <span>

                                    <strong>
                                        Role:
                                    </strong>

                                    ${user.role}

                                </span>

                            </p>


                            <p class="candidate-detail">

                                <i class="fa-solid fa-hashtag"></i>

                                <span>

                                    <strong>
                                        User ID:
                                    </strong>

                                    ${user.id}

                                </span>

                            </p>


                            <p class="candidate-detail">

                                <i class="fa-solid fa-briefcase"></i>

                                <span>

                                    <strong>
                                        Job ID:
                                    </strong>

                                    ${jobId}

                                </span>

                            </p>


                        </div>


                        <!-- ACTIONS -->

                        <div class="card-actions">


                            <a
                                href="${pageContext.request.contextPath}/recruiterprofile?id=${user.id}"
                                class="action-btn profile-btn">

                                <i class="fa-solid fa-user"></i>

                                Profile

                            </a>


                            <a
                                href="${pageContext.request.contextPath}/shortlistcandidate?userId=${user.id}&amp;jobId=${jobId}"
                                class="action-btn shortlist-btn">

                                <i class="fa-solid fa-check"></i>

                                Shortlist

                            </a>


                            <a
                                href="${pageContext.request.contextPath}/rejectcandidate?userId=${user.id}&amp;jobId=${jobId}"
                                class="action-btn reject-btn">

                                <i class="fa-solid fa-xmark"></i>

                                Reject

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