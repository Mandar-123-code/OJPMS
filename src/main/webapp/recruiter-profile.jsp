<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Recruiter Profile | SMARTHIRE</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@500;600;700&display=swap"
        rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
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
            left: 0;
            top: 0;

            width: 250px;
            height: 100vh;

            background: var(--ink);
            color: white;

            padding: 25px 16px;

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

            border-radius: 13px;

            background: var(--mint);
            color: var(--ink);

            font-size: 18px;

            flex-shrink: 0;
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

            margin: 17px 8px;

            background: rgba(255, 255, 255, 0.09);
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

            border-bottom: 1px solid var(--line);
        }


        .topbar-left h1 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 22px;

            letter-spacing: -0.7px;
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
           PROFILE CONTENT
        ===================================== */

        .profile-page-content {
            max-width: 1100px;

            margin: 30px auto 0;
        }


        /* =====================================
           PROFILE BANNER
        ===================================== */

        .profile-banner {
            position: relative;

            height: 175px;

            overflow: hidden;

            border-radius: 22px 22px 0 0;

            background: var(--ink);

            box-shadow: var(--shadow);
        }


        .profile-banner::before {
            content: "";

            position: absolute;

            width: 330px;
            height: 330px;

            border-radius: 50%;

            background: var(--mint);

            opacity: 0.09;

            right: -100px;
            top: -190px;
        }


        .profile-banner::after {
            content: "";

            position: absolute;

            width: 210px;
            height: 210px;

            border-radius: 50%;

            border: 1px solid rgba(217, 246, 127, 0.16);

            right: 150px;
            bottom: -150px;
        }


        /* =====================================
           PROFILE HEADER
        ===================================== */

        .profile-header-card {
            position: relative;

            margin-top: -1px;

            padding: 0 34px 30px;

            background: white;

            border-left: 1px solid var(--line);
            border-right: 1px solid var(--line);
            border-bottom: 1px solid var(--line);
        }


        .profile-header-row {
            display: flex;
            align-items: flex-end;

            gap: 20px;

            position: relative;

            top: -55px;

            margin-bottom: -55px;
        }


        .profile-avatar {
            width: 108px;
            height: 108px;

            flex-shrink: 0;

            display: flex;
            align-items: center;
            justify-content: center;

            border: 6px solid white;

            border-radius: 50%;

            background: var(--mint);

            color: var(--ink);

            font-family: "Space Grotesk", sans-serif;

            font-size: 40px;
            font-weight: 700;

            text-transform: uppercase;

            box-shadow: 0 12px 30px rgba(19, 33, 30, 0.13);
        }


        .profile-info {
            padding-bottom: 3px;
        }


        .profile-info h1 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 28px;

            letter-spacing: -1px;
        }


        .profile-role {
            display: inline-flex;

            align-items: center;

            margin-top: 7px;

            padding: 5px 10px;

            border-radius: 50px;

            background: #edf4e0;

            color: #536e32;

            font-size: 10px;
            font-weight: 700;

            text-transform: uppercase;

            letter-spacing: 0.5px;
        }


        .profile-email {
            display: flex;
            align-items: center;

            gap: 7px;

            margin-top: 10px;

            color: var(--muted);

            font-size: 12px;
        }


        .profile-email i {
            color: var(--coral);
        }


        .profile-actions {
            display: flex;
            align-items: center;
            gap: 12px;

            margin-top: 15px;
        }


        .edit-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;

            min-height: 39px;

            padding: 0 15px;

            border: none;

            border-radius: 9px;

            background: var(--ink);

            color: white;

            font-size: 12px;
            font-weight: 700;

            cursor: pointer;

            transition: 0.25s ease;
        }


        .edit-btn:hover {
            background: #20332f;

            transform: translateY(-2px);

            box-shadow: 0 8px 18px rgba(19, 33, 30, 0.14);
        }


        .success-message {
            color: var(--green);

            font-size: 12px;

            font-weight: 600;
        }


        /* =====================================
           STATS
        ===================================== */

        .stats-grid {
            display: grid;

            grid-template-columns: repeat(4, 1fr);

            gap: 15px;

            margin-top: 20px;
        }


        .stat-card {
            background: white;

            border: 1px solid var(--line);

            border-radius: 15px;

            padding: 19px 20px;

            min-height: 120px;

            transition: 0.25s ease;

            animation: fadeUp 0.5s ease both;
        }


        .stat-card:nth-child(2) {
            animation-delay: 0.06s;
        }


        .stat-card:nth-child(3) {
            animation-delay: 0.12s;
        }


        .stat-card:nth-child(4) {
            animation-delay: 0.18s;
        }


        .stat-card:hover {
            transform: translateY(-4px);

            box-shadow: 0 12px 28px rgba(19, 33, 30, 0.07);

            border-color: #c4cec4;
        }


        .stat-icon {
            width: 35px;
            height: 35px;

            display: flex;
            align-items: center;
            justify-content: center;

            margin-bottom: 12px;

            border-radius: 9px;

            background: var(--soft);

            color: var(--ink);

            font-size: 13px;
        }


        .stat-number {
            font-family: "Space Grotesk", sans-serif;

            font-size: 20px;
            font-weight: 700;

            letter-spacing: -0.5px;

            white-space: nowrap;

            overflow: hidden;
            text-overflow: ellipsis;
        }


        .stat-label {
            margin-top: 3px;

            color: var(--muted);

            font-size: 11px;
        }


        .active-status {
            color: var(--green);
        }


        /* =====================================
           SECTION CARDS
        ===================================== */

        .section-card {
            margin-top: 20px;

            padding: 24px 27px;

            background: white;

            border: 1px solid var(--line);

            border-radius: 17px;

            animation: fadeUp 0.55s ease both;
        }


        .section-card h2 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 17px;

            letter-spacing: -0.4px;

            padding-bottom: 15px;

            margin-bottom: 2px;

            border-bottom: 1px solid #edf0eb;
        }


        /* =====================================
           ACCOUNT TABLE
        ===================================== */

        .account-table {
            width: 100%;

            border-collapse: collapse;
        }


        .account-table tr {
            border-bottom: 1px solid #edf0eb;
        }


        .account-table tr:last-child {
            border-bottom: none;
        }


        .account-table td {
            padding: 14px 0;

            font-size: 13px;
        }


        .account-table td:first-child {
            width: 170px;

            color: var(--muted);

            font-weight: 600;
        }


        .account-table td:last-child {
            color: var(--ink);

            font-weight: 500;
        }


        /* =====================================
           FEATURE CHIPS
        ===================================== */

        .skill-chips {
            display: flex;

            flex-wrap: wrap;

            gap: 9px;

            margin-top: 17px;
        }


        .skill-chip {
            display: inline-flex;
            align-items: center;

            min-height: 33px;

            padding: 0 12px;

            border: 1px solid var(--line);

            border-radius: 50px;

            background: #fafbf8;

            color: #53615b;

            font-size: 11px;
            font-weight: 600;

            transition: 0.22s ease;
        }


        .skill-chip:hover {
            background: var(--mint);

            border-color: var(--mint);

            color: var(--ink);

            transform: translateY(-2px);
        }


        /* =====================================
           PROFILE COMPLETION
        ===================================== */

        .completion-row {
            display: flex;
            align-items: center;

            gap: 14px;

            margin-top: 18px;
        }


        .progress-bar {
            flex: 1;

            height: 9px;

            overflow: hidden;

            border-radius: 50px;

            background: #e7ebe3;
        }


        .progress-bar-fill {
            width: 80%;
            height: 100%;

            border-radius: inherit;

            background: var(--mint);
        }


        .completion-value {
            min-width: 42px;

            color: var(--ink);

            font-family: "Space Grotesk", sans-serif;

            font-size: 13px;
            font-weight: 700;

            text-align: right;
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

        @media (max-width: 1000px) {

            .main-content {
                padding-left: 25px;
                padding-right: 25px;
            }


            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

        }


        @media (max-width: 750px) {

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

                padding: 0 15px 35px;
            }


            .topbar {
                min-height: 70px;
            }


            .topbar-left h1 {
                font-size: 19px;
            }


            .profile-page-content {
                margin-top: 20px;
            }


            .profile-banner {
                height: 130px;
            }


            .profile-header-card {
                padding: 0 20px 25px;
            }


            .profile-header-row {
                align-items: flex-start;

                flex-direction: column;

                top: -50px;

                margin-bottom: -50px;
            }


            .profile-avatar {
                width: 90px;
                height: 90px;

                font-size: 32px;
            }


            .profile-info h1 {
                font-size: 25px;
            }


            .stats-grid {
                grid-template-columns: 1fr 1fr;
            }

        }


        @media (max-width: 480px) {

            .sidebar-nav {
                grid-template-columns: 1fr;
            }


            .topbar {
                align-items: flex-start;

                flex-direction: column;

                gap: 10px;

                padding: 17px 0;
            }


            .dashboard-btn {
                width: 100%;

                justify-content: center;
            }


            .stats-grid {
                grid-template-columns: 1fr;
            }


            .section-card {
                padding: 21px 18px;
            }


            .account-table td {
                padding: 12px 0;

                font-size: 12px;
            }


            .account-table td:first-child {
                width: 105px;
            }


            .profile-actions {
                align-items: flex-start;

                flex-direction: column;
            }


            .success-message {
                margin-left: 0;
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
            <span>Recruiter Portal</span>
        </div>

    </div>


    <nav class="sidebar-nav">

        <a href="${pageContext.request.contextPath}/recruiter-dashboard.jsp">
            <i class="fa-solid fa-gauge"></i>
            <span>Dashboard</span>
        </a>


        <a href="#" class="active">
            <i class="fa-solid fa-user-tie"></i>
            <span>Profile</span>
        </a>


        <a href="${pageContext.request.contextPath}/postedjobs">
            <i class="fa-solid fa-list-ul"></i>
            <span>My Jobs</span>
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

</div>


<!-- =====================================
     MAIN CONTENT
===================================== -->

<div class="main-content">


    <!-- TOPBAR -->

    <div class="topbar">

        <div class="topbar-left">
            <h1>Recruiter Profile</h1>
        </div>


        <div class="topbar-right">

            <a href="${pageContext.request.contextPath}/recruiter-dashboard.jsp"
               class="dashboard-btn">

                <i class="fa-solid fa-arrow-left"></i>

                Back to Dashboard

            </a>

        </div>

    </div>


    <!-- PROFILE -->

    <div class="profile-page-content">


        <!-- DARK PROFILE BANNER -->

        <div class="profile-banner"></div>


        <!-- PROFILE HEADER -->

        <div class="profile-header-card">

            <div class="profile-header-row">


                <div class="profile-avatar">

                    ${user.name.substring(0,1)}

                </div>


                <div class="profile-info">

                    <h1>
                        ${user.name}
                    </h1>


                    <span class="profile-role">
                        ${user.role}
                    </span>


                    <p class="profile-email">

                        <i class="fa-solid fa-envelope"></i>

                        ${user.email}

                    </p>


                    <div class="profile-actions">

                        <form action="${pageContext.request.contextPath}/editrecruiterprofile">

                            <input type="hidden"
                                   name="userId"
                                   value="${user.id}">

                            <button type="submit"
                                    class="edit-btn">

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

        </div>


        <!-- =====================================
             PROFILE STATS
        ===================================== -->

        <div class="stats-grid">


            <div class="stat-card">

                <div class="stat-icon">
                    <i class="fa-solid fa-hashtag"></i>
                </div>

                <div class="stat-number">
                    ${user.id}
                </div>

                <div class="stat-label">
                    User ID
                </div>

            </div>


            <div class="stat-card">

                <div class="stat-icon">
                    <i class="fa-solid fa-id-badge"></i>
                </div>

                <div class="stat-number">
                    ${user.role}
                </div>

                <div class="stat-label">
                    Account Role
                </div>

            </div>


            <div class="stat-card">

                <div class="stat-icon">
                    <i class="fa-solid fa-circle-check"></i>
                </div>

                <div class="stat-number">
                    100%
                </div>

                <div class="stat-label">
                    Profile Complete
                </div>

            </div>


            <div class="stat-card">

                <div class="stat-icon">
                    <i class="fa-solid fa-signal"></i>
                </div>

                <div class="stat-number active-status">
                    Active
                </div>

                <div class="stat-label">
                    Account Status
                </div>

            </div>

        </div>


        <!-- =====================================
             ACCOUNT INFORMATION
        ===================================== -->

        <div class="section-card">

            <h2>
                Account Information
            </h2>


            <table class="account-table">

                <tr>

                    <td>
                        ID
                    </td>

                    <td>
                        ${user.id}
                    </td>

                </tr>


                <tr>

                    <td>
                        Name
                    </td>

                    <td>
                        ${user.name}
                    </td>

                </tr>


                <tr>

                    <td>
                        Email
                    </td>

                    <td>
                        ${user.email}
                    </td>

                </tr>


                <tr>

                    <td>
                        Role
                    </td>

                    <td>
                        ${user.role}
                    </td>

                </tr>

            </table>

        </div>


        <!-- =====================================
             RECRUITER FEATURES
        ===================================== -->

        <div class="section-card">

            <h2>
                Recruiter Features
            </h2>


            <div class="skill-chips">

                <span class="skill-chip">
                    Job Posting
                </span>

                <span class="skill-chip">
                    Candidate Search
                </span>

                <span class="skill-chip">
                    Recruitment
                </span>

                <span class="skill-chip">
                    Hiring
                </span>

                <span class="skill-chip">
                    Interview Management
                </span>

            </div>

        </div>


        <!-- =====================================
             PROFILE COMPLETION
        ===================================== -->

        <div class="section-card">

            <h2>
                Profile Completion
            </h2>


            <div class="completion-row">

                <div class="progress-bar">

                    <div class="progress-bar-fill"></div>

                </div>


                <span class="completion-value">
                    80%
                </span>

            </div>

        </div>


    </div>

</div>


</body>
</html>