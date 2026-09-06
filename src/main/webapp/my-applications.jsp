<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <meta name="description"
        content="Track and manage your job applications on SMARTHIRE">

    <title>My Applications | SMARTHIRE</title>

    <link rel="icon"
        href="${pageContext.request.contextPath}/favicon.svg"
        type="image/svg+xml">

    <!-- Google Fonts -->
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

        /* =====================================================
           SMARTHIRE - MY APPLICATIONS
        ===================================================== */

        :root {
            --ink: #13211e;
            --ink-soft: #263832;

            --mint: #d9f67f;
            --mint-dark: #b8d65f;

            --coral: #f27961;

            --paper: #f4f1e8;
            --white: #ffffff;

            --line: #d6ddd1;
            --line-soft: #e6eae3;

            --muted: #75817b;
            --muted-dark: #56635d;

            --blue: #4777a8;
            --green: #527c4e;

            --shadow:
                0 18px 50px rgba(19, 33, 30, 0.08);
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
                    circle at 80% 0%,
                    rgba(217, 246, 127, 0.13),
                    transparent 25%
                ),
                var(--paper);

            overflow-x: hidden;
        }


        a {
            text-decoration: none;
            color: inherit;
        }


        button {
            font-family: inherit;
        }


        /* =====================================================
           SIDEBAR
        ===================================================== */

        .sidebar {
            position: fixed;

            top: 0;
            left: 0;
            bottom: 0;

            width: 250px;

            background: var(--ink);

            color: white;

            padding: 25px 16px;

            z-index: 100;

            display: flex;

            flex-direction: column;

            box-shadow:
                12px 0 35px rgba(19, 33, 30, 0.08);
        }


        .sidebar-logo {
            display: flex;

            align-items: center;

            gap: 12px;

            padding: 5px 10px 28px;

            border-bottom:
                1px solid rgba(255, 255, 255, 0.09);
        }


        .sidebar-logo-icon {
            width: 42px;
            height: 42px;

            flex-shrink: 0;

            display: flex;

            align-items: center;
            justify-content: center;

            border-radius: 12px;

            background: var(--mint);

            color: var(--ink);

            font-size: 16px;
        }


        .sidebar-logo-text h2 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 17px;

            letter-spacing: -0.5px;
        }


        .sidebar-logo-text span {
            display: block;

            margin-top: 4px;

            color: rgba(255, 255, 255, 0.48);

            font-size: 9px;

            font-weight: 600;

            text-transform: uppercase;

            letter-spacing: 0.7px;
        }


        .sidebar-nav {
            display: flex;

            flex-direction: column;

            gap: 5px;

            padding-top: 25px;
        }


        .sidebar-nav a {
            display: flex;

            align-items: center;

            gap: 12px;

            min-height: 44px;

            padding: 0 13px;

            border-radius: 10px;

            color: rgba(255, 255, 255, 0.62);

            font-size: 12px;

            font-weight: 600;

            transition:
                background 0.2s ease,
                color 0.2s ease,
                transform 0.2s ease;
        }


        .sidebar-nav a i {
            width: 17px;

            text-align: center;

            font-size: 13px;
        }


        .sidebar-nav a:hover {
            background: rgba(255, 255, 255, 0.07);

            color: white;

            transform: translateX(2px);
        }


        .sidebar-nav a.active {
            background: var(--mint);

            color: var(--ink);

            box-shadow:
                0 8px 20px rgba(217, 246, 127, 0.12);
        }


        .nav-divider {
            height: 1px;

            margin: 15px 8px;

            background:
                rgba(255, 255, 255, 0.09);
        }


        .sidebar-nav .logout-link {
            color: rgba(242, 121, 97, 0.82);
        }


        .sidebar-nav .logout-link:hover {
            color: #ff9a87;

            background:
                rgba(242, 121, 97, 0.08);
        }


        /* =====================================================
           MAIN CONTENT
        ===================================================== */

        .main-content {
            min-height: 100vh;

            margin-left: 250px;
        }


        /* =====================================================
           TOPBAR
        ===================================================== */

        .topbar {
            height: 78px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 34px;

            background:
                rgba(244, 241, 232, 0.86);

            border-bottom:
                1px solid var(--line);

            backdrop-filter: blur(15px);

            position: sticky;

            top: 0;

            z-index: 50;
        }


        .topbar-left {
            display: flex;

            align-items: center;

            gap: 13px;
        }


        .ma-back-btn {
            width: 35px;
            height: 35px;

            display: flex;

            align-items: center;
            justify-content: center;

            border: 1px solid var(--line);

            border-radius: 9px;

            background: white;

            color: var(--muted-dark);

            font-size: 12px;

            transition:
                transform 0.2s ease,
                background 0.2s ease,
                color 0.2s ease;
        }


        .ma-back-btn:hover {
            background: var(--ink);

            color: white;

            transform: translateX(-2px);
        }


        .topbar h1 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 21px;

            letter-spacing: -0.8px;
        }


        .topbar-right {
            display: flex;

            align-items: center;
        }


        .btn {
            display: inline-flex;

            align-items: center;
            justify-content: center;

            gap: 8px;

            border: none;

            border-radius: 9px;

            cursor: pointer;

            font-size: 11px;

            font-weight: 700;

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                background 0.2s ease;
        }


        .btn-sm {
            min-height: 37px;

            padding: 0 14px;
        }


        .btn-secondary {
            background: white;

            border: 1px solid var(--line);

            color: var(--muted-dark);
        }


        .btn-secondary:hover {
            background: var(--ink);

            color: white;

            border-color: var(--ink);

            transform: translateY(-1px);
        }


        .btn-primary {
            padding: 11px 18px;

            background: var(--ink);

            color: white;
        }


        .btn-primary:hover {
            background: #1c302a;

            transform: translateY(-2px);

            box-shadow:
                0 10px 22px rgba(19, 33, 30, 0.15);
        }


        /* =====================================================
           PAGE HEADER
        ===================================================== */

        .page-header {
            margin: 28px 28px 22px;

            padding: 29px 32px;

            min-height: 175px;

            position: relative;

            overflow: hidden;

            border-radius: 20px;

            background: var(--ink);

            color: white;

            box-shadow: var(--shadow);

            animation: fadeUp 0.55s ease both;
        }


        .page-header::before {
            content: "";

            position: absolute;

            width: 270px;
            height: 270px;

            right: -90px;
            top: -140px;

            border-radius: 50%;

            background:
                rgba(217, 246, 127, 0.13);
        }


        .page-header::after {
            content: "";

            position: absolute;

            width: 120px;
            height: 120px;

            right: 150px;
            bottom: -80px;

            border-radius: 50%;

            background:
                rgba(242, 121, 97, 0.10);
        }


        .header-content {
            position: relative;

            z-index: 2;
        }


        .header-eyebrow {
            display: inline-flex;

            align-items: center;

            gap: 7px;

            margin-bottom: 11px;

            color: var(--mint);

            font-size: 9px;

            font-weight: 800;

            letter-spacing: 1.2px;

            text-transform: uppercase;
        }


        .header-eyebrow i {
            font-size: 8px;
        }


        .page-header h2 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 31px;

            letter-spacing: -1.3px;

            margin-bottom: 8px;
        }


        .page-header p {
            max-width: 570px;

            color: rgba(255, 255, 255, 0.62);

            font-size: 12px;

            line-height: 1.6;
        }


        /* =====================================================
           STATS
        ===================================================== */

        .stats-grid {
            display: grid;

            grid-template-columns:
                repeat(2, minmax(0, 1fr));

            gap: 17px;

            padding: 0 28px 22px;
        }


        .stat-card {
            min-height: 118px;

            padding: 21px;

            display: grid;

            grid-template-columns: 43px 1fr;

            grid-template-rows: auto auto;

            column-gap: 14px;

            align-items: center;

            background: white;

            border: 1px solid var(--line);

            border-radius: 15px;

            box-shadow:
                0 7px 22px rgba(19, 33, 30, 0.045);

            transition:
                transform 0.22s ease,
                box-shadow 0.22s ease;
        }


        .stat-card:hover {
            transform: translateY(-3px);

            box-shadow:
                0 14px 30px rgba(19, 33, 30, 0.08);
        }


        .stat-icon {
            grid-row: 1 / 3;

            width: 43px;
            height: 43px;

            display: flex;

            align-items: center;
            justify-content: center;

            border-radius: 12px;

            background: #edf4df;

            color: #627c3f;

            font-size: 15px;
        }


        .stat-number {
            font-family: "Space Grotesk", sans-serif;

            font-size: 25px;

            font-weight: 700;

            line-height: 1;

            margin-bottom: 5px;
        }


        .stat-label {
            color: var(--muted);

            font-size: 10px;

            font-weight: 600;
        }


        /* =====================================================
           APPLICATION SECTION
        ===================================================== */

        .applications-section {
            padding: 0 28px 35px;
        }


        .table-wrapper {
            background: white;

            border: 1px solid var(--line);

            border-radius: 17px;

            overflow: hidden;

            box-shadow:
                0 9px 28px rgba(19, 33, 30, 0.055);

            animation: fadeUp 0.6s 0.1s ease both;
        }


        .table-title {
            min-height: 68px;

            padding: 0 22px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            border-bottom:
                1px solid var(--line-soft);
        }


        .table-title-left {
            display: flex;

            align-items: center;

            gap: 10px;
        }


        .table-title-icon {
            width: 32px;
            height: 32px;

            display: flex;

            align-items: center;
            justify-content: center;

            border-radius: 9px;

            background: #edf4df;

            color: #627c3f;

            font-size: 12px;
        }


        .table-title h2 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 16px;

            letter-spacing: -0.5px;
        }


        .application-count {
            padding: 5px 9px;

            border-radius: 999px;

            background: #f0f3ed;

            color: var(--muted-dark);

            font-size: 9px;

            font-weight: 800;
        }


        /* =====================================================
           TABLE
        ===================================================== */

        .table-scroll {
            width: 100%;

            overflow-x: auto;
        }


        .data-table {
            width: 100%;

            min-width: 760px;

            border-collapse: collapse;
        }


        .data-table thead {
            background: #f7f8f5;
        }


        .data-table th {
            padding: 13px 18px;

            text-align: left;

            border-bottom:
                1px solid var(--line-soft);

            color: #7b8580;

            font-size: 9px;

            font-weight: 800;

            text-transform: uppercase;

            letter-spacing: 0.7px;

            white-space: nowrap;
        }


        .data-table td {
            padding: 17px 18px;

            border-bottom:
                1px solid #edf0eb;

            color: var(--muted-dark);

            font-size: 11px;

            vertical-align: middle;
        }


        .data-table tbody tr {
            transition:
                background 0.18s ease;
        }


        .data-table tbody tr:hover {
            background: #fafbf8;
        }


        .data-table tbody tr:last-child td {
            border-bottom: none;
        }


        .job-id {
            display: inline-flex;

            align-items: center;

            justify-content: center;

            min-width: 34px;

            padding: 5px 7px;

            border-radius: 6px;

            background: #f0f3ed;

            color: var(--muted-dark);

            font-size: 9px;

            font-weight: 800;
        }


        .job-title {
            color: var(--ink);

            font-size: 12px;

            font-weight: 700;
        }


        .location-cell,
        .salary-cell {
            display: inline-flex;

            align-items: center;

            white-space: nowrap;
        }


        .location-cell i {
            margin-right: 6px;

            color: var(--blue);

            font-size: 10px;
        }


        .salary-cell {
            color: var(--green);

            font-weight: 700;
        }


        .salary-cell i {
            margin-right: 5px;

            font-size: 10px;
        }


        .ma-desc {
            max-width: 290px;

            color: #68746e;

            line-height: 1.55;
        }


        /* =====================================================
           EMPTY STATE
        ===================================================== */

        .empty-state {
            padding: 65px 25px 70px;

            text-align: center;
        }


        .empty-icon {
            width: 65px;
            height: 65px;

            display: flex;

            align-items: center;
            justify-content: center;

            margin: 0 auto 17px;

            border-radius: 18px;

            background: #f0f3ed;

            color: #7d8b83;

            font-size: 22px;
        }


        .empty-state h3 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 19px;

            letter-spacing: -0.5px;

            margin-bottom: 7px;
        }


        .empty-state p {
            max-width: 360px;

            margin: 0 auto;

            color: var(--muted);

            font-size: 12px;

            line-height: 1.6;
        }


        .empty-state .btn {
            margin-top: 20px;
        }


        /* =====================================================
           ANIMATIONS
        ===================================================== */

        @keyframes fadeUp {

            from {
                opacity: 0;

                transform: translateY(15px);
            }

            to {
                opacity: 1;

                transform: translateY(0);
            }
        }


        /* =====================================================
           TABLET
        ===================================================== */

        @media (max-width: 900px) {

            .sidebar {
                width: 215px;
            }


            .main-content {
                margin-left: 215px;
            }


            .topbar {
                padding: 0 22px;
            }


            .page-header {
                margin-left: 22px;
                margin-right: 22px;
            }


            .stats-grid,
            .applications-section {
                padding-left: 22px;
                padding-right: 22px;
            }

        }


        /* =====================================================
           MOBILE
        ===================================================== */

        @media (max-width: 700px) {

            .sidebar {
                position: relative;

                width: 100%;

                height: auto;

                padding: 15px;

                box-shadow: none;
            }


            .sidebar-logo {
                padding: 5px 5px 15px;
            }


            .sidebar-nav {
                display: grid;

                grid-template-columns:
                    repeat(2, 1fr);

                gap: 5px;

                padding-top: 15px;
            }


            .sidebar-nav a {
                min-height: 40px;

                font-size: 10px;
            }


            .nav-divider {
                display: none;
            }


            .main-content {
                margin-left: 0;
            }


            .topbar {
                height: 66px;

                padding: 0 15px;
            }


            .topbar h1 {
                font-size: 17px;
            }


            .topbar-right {
                display: none;
            }


            .page-header {
                margin: 17px 15px;

                padding: 24px 21px;

                min-height: auto;
            }


            .page-header h2 {
                font-size: 25px;
            }


            .stats-grid {
                grid-template-columns: 1fr;

                padding:
                    0 15px 17px;
            }


            .applications-section {
                padding:
                    0 15px 25px;
            }


            .table-title {
                padding: 0 15px;
            }

        }


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


<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
        return;
    }
%>


<!-- =========================================================
     SIDEBAR
========================================================= -->

<div class="sidebar">

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


        <a
            href="${pageContext.request.contextPath}/myapplications"
            class="active">

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


<!-- =========================================================
     MAIN CONTENT
========================================================= -->

<div class="main-content">


    <!-- =====================================================
         TOPBAR
    ====================================================== -->

    <div class="topbar">

        <div class="topbar-left">

            <a
                href="${pageContext.request.contextPath}/user-dashboard.jsp"
                class="ma-back-btn"
                aria-label="Back to dashboard">

                <i class="fa-solid fa-arrow-left"></i>

            </a>


            <h1>My Applications</h1>

        </div>


        <div class="topbar-right">

            <a
                href="${pageContext.request.contextPath}/logout"
                class="btn btn-secondary btn-sm">

                <i class="fa-solid fa-right-from-bracket"></i>

                Logout

            </a>

        </div>

    </div>


    <!-- =====================================================
         PAGE HEADER
    ====================================================== -->

    <section class="page-header">

        <div class="header-content">

            <div class="header-eyebrow">

                <i class="fa-solid fa-chart-line"></i>

                APPLICATION TRACKER

            </div>


            <h2>Keep your career moving.</h2>


            <p>
                Review the jobs you've applied for and keep track
                of your application journey from one place.
            </p>

        </div>

    </section>


    <!-- =====================================================
         STATS
    ====================================================== -->

    <section class="stats-grid">


        <div class="stat-card">

            <div class="stat-icon">

                <i class="fa-solid fa-file-circle-check"></i>

            </div>


            <div class="stat-number">
                ${totalApplications}
            </div>


            <div class="stat-label">
                Total Applications
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">

                <i class="fa-solid fa-briefcase"></i>

            </div>


            <div class="stat-number">
                ${totalApplications}
            </div>


            <div class="stat-label">
                Applied Jobs
            </div>

        </div>


    </section>


    <!-- =====================================================
         APPLICATIONS
    ====================================================== -->

    <section class="applications-section">

        <div class="table-wrapper">


            <!-- TABLE HEADER -->

            <div class="table-title">

                <div class="table-title-left">

                    <div class="table-title-icon">

                        <i class="fa-solid fa-list-check"></i>

                    </div>


                    <h2>
                        Applied Jobs
                    </h2>

                </div>


                <c:if test="${not empty applications}">

                    <span class="application-count">

                        ${totalApplications} APPLICATIONS

                    </span>

                </c:if>

            </div>


            <!-- =================================================
                 EMPTY STATE
            ================================================== -->

            <c:if test="${empty applications}">

                <div class="empty-state">

                    <div class="empty-icon">

                        <i class="fa-solid fa-file-circle-xmark"></i>

                    </div>


                    <h3>
                        No Applications Yet
                    </h3>


                    <p>
                        You haven't applied to any jobs yet.
                        Explore current openings and find an
                        opportunity that matches your skills.
                    </p>


                    <a
                        href="${pageContext.request.contextPath}/viewjob"
                        class="btn btn-primary">

                        <i class="fa-solid fa-magnifying-glass"></i>

                        Browse Jobs

                    </a>

                </div>

            </c:if>


            <!-- =================================================
                 APPLICATION TABLE
            ================================================== -->

            <c:if test="${not empty applications}">

                <div class="table-scroll">

                    <table class="data-table">


                        <thead>

                            <tr>

                                <th>
                                    Job ID
                                </th>

                                <th>
                                    Job Title
                                </th>

                                <th>
                                    Location
                                </th>

                                <th>
                                    Salary
                                </th>

                                <th>
                                    Description
                                </th>

                            </tr>

                        </thead>


                        <tbody>

                            <c:forEach
                                items="${applications}"
                                var="app">

                                <tr>


                                    <!-- JOB ID -->

                                    <td>

                                        <span class="job-id">

                                            #${app.job.id}

                                        </span>

                                    </td>


                                    <!-- JOB TITLE -->

                                    <td>

                                        <strong class="job-title">

                                            ${app.job.title}

                                        </strong>

                                    </td>


                                    <!-- LOCATION -->

                                    <td>

                                        <span class="location-cell">

                                            <i
                                                class="fa-solid fa-location-dot">
                                            </i>

                                            ${app.job.location}

                                        </span>

                                    </td>


                                    <!-- SALARY -->

                                    <td>

                                        <span class="salary-cell">

                                            <i
                                                class="fa-solid fa-indian-rupee-sign">
                                            </i>

                                            ${app.job.salary}

                                        </span>

                                    </td>


                                    <!-- DESCRIPTION -->

                                    <td class="ma-desc">

                                        ${app.job.description}

                                    </td>


                                </tr>

                            </c:forEach>

                        </tbody>

                    </table>

                </div>

            </c:if>


        </div>

    </section>


</div>


</body>

</html>