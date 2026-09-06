<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Edit Job | SMARTHIRE</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@500;600;700&display=swap"
        rel="stylesheet">

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet" href="css/global.css">

    <style>

        :root {
            --ink: #13211e;
            --mint: #d9f67f;
            --coral: #f27961;
            --paper: #f4f1e8;
            --white: #ffffff;
            --line: #d9dfd5;
            --muted: #68756f;
            --soft: #eef1eb;
            --danger: #c94f43;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'DM Sans', sans-serif;
            background: var(--paper);
            color: var(--ink);
        }

        /* =====================================================
           SIDEBAR
        ===================================================== */

        .sidebar {
            width: 250px;
            height: 100vh;

            position: fixed;
            left: 0;
            top: 0;

            background: var(--ink);
            color: white;

            padding: 25px 16px;

            display: flex;
            flex-direction: column;

            z-index: 100;
        }

        .sidebar-logo {
            display: flex;
            align-items: center;
            gap: 12px;

            padding: 4px 10px 30px;
        }

        .sidebar-logo-icon {
            width: 43px;
            height: 43px;

            border-radius: 12px;

            background: var(--mint);
            color: var(--ink);

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 18px;
        }

        .sidebar-logo-text h2 {
            margin: 0;

            font-family: 'Space Grotesk', sans-serif;
            font-size: 21px;
            letter-spacing: -.5px;
        }

        .sidebar-logo-text span {
            display: block;

            margin-top: 2px;

            font-size: 11px;
            color: #aab5b0;
        }

        .sidebar-nav {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .sidebar-nav a {
            color: #b9c2be;
            text-decoration: none;

            padding: 12px 13px;

            border-radius: 10px;

            display: flex;
            align-items: center;
            gap: 12px;

            font-size: 14px;
            font-weight: 500;

            transition:
                background .2s ease,
                color .2s ease,
                transform .2s ease;
        }

        .sidebar-nav a i {
            width: 18px;
            text-align: center;
        }

        .sidebar-nav a:hover {
            background: rgba(255, 255, 255, .07);
            color: white;
            transform: translateX(2px);
        }

        .sidebar-nav a.active {
            background: var(--mint);
            color: var(--ink);
            font-weight: 700;
        }

        .nav-divider {
            height: 1px;
            background: rgba(255,255,255,.10);
            margin: 18px 10px;
        }

        .sidebar-nav .logout-link:hover {
            background: rgba(242, 121, 97, .12);
            color: #ff9d8b;
        }

        /* =====================================================
           MAIN
        ===================================================== */

        .main-content {
            margin-left: 250px;
            min-height: 100vh;
            padding: 0 42px 60px;
        }

        /* =====================================================
           TOPBAR
        ===================================================== */

        .topbar {
            min-height: 82px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            border-bottom: 1px solid var(--line);
        }

        .topbar-left h1 {
            margin: 0;

            font-family: 'Space Grotesk', sans-serif;

            font-size: 24px;
            letter-spacing: -.7px;
        }

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        /* =====================================================
           BUTTONS
        ===================================================== */

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;

            text-decoration: none;

            border-radius: 10px;

            font-size: 13px;
            font-weight: 700;

            transition:
                transform .2s ease,
                box-shadow .2s ease,
                background .2s ease;
        }

        .btn-sm {
            padding: 10px 15px;
        }

        .btn-secondary {
            color: var(--ink);
            background: white;
            border: 1px solid var(--line);
        }

        .btn-secondary:hover {
            transform: translateY(-1px);
            box-shadow: 0 7px 18px rgba(19, 33, 30, .07);
        }

        /* =====================================================
           PAGE HEADER
        ===================================================== */

        .ej-page-header {
            max-width: 1120px;

            margin: 35px auto 25px;

            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            gap: 20px;
        }

        .ej-eyebrow {
            display: inline-flex;
            align-items: center;
            gap: 7px;

            color: #60706a;

            font-size: 11px;
            font-weight: 700;

            text-transform: uppercase;
            letter-spacing: 1.2px;

            margin-bottom: 9px;
        }

        .ej-page-title {
            margin: 0;

            font-family: 'Space Grotesk', sans-serif;

            font-size: 32px;
            letter-spacing: -1.3px;
        }

        .ej-page-description {
            margin: 8px 0 0;

            color: var(--muted);

            font-size: 14px;
            line-height: 1.6;
        }

        /* =====================================================
           LAYOUT
        ===================================================== */

        .ej-container {
            max-width: 1120px;

            margin: 0 auto;

            display: grid;
            grid-template-columns: 330px minmax(0, 1fr);

            gap: 22px;

            align-items: start;
        }

        /* =====================================================
           LEFT JOB CARD
        ===================================================== */

        .ej-profile-card {
            background: var(--ink);

            border-radius: 22px;

            padding: 30px 27px;

            min-height: 370px;

            position: relative;
            overflow: hidden;

            color: white;

            box-shadow: 0 18px 40px rgba(19, 33, 30, .12);

            animation: cardIn .55s ease both;
        }

        .ej-profile-card::before {
            content: "";

            width: 180px;
            height: 180px;

            position: absolute;
            right: -75px;
            top: -75px;

            background: var(--mint);

            border-radius: 50%;

            opacity: .9;
        }

        .ej-profile-card::after {
            content: "";

            width: 110px;
            height: 110px;

            position: absolute;
            right: 20px;
            bottom: -65px;

            background: var(--coral);

            border-radius: 50%;

            opacity: .85;
        }

        .ej-card-label {
            position: relative;
            z-index: 2;

            font-size: 11px;
            font-weight: 700;

            color: #aeb9b4;

            letter-spacing: 1.2px;
            text-transform: uppercase;
        }

        .ej-job-circle {
            width: 66px;
            height: 66px;

            margin: 32px 0 22px;

            background: var(--mint);
            color: var(--ink);

            border-radius: 18px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 25px;

            position: relative;
            z-index: 2;

            transition: transform .25s ease;
        }

        .ej-profile-card:hover .ej-job-circle {
            transform: rotate(-4deg) scale(1.04);
        }

        .ej-profile-card h2 {
            position: relative;
            z-index: 2;

            margin: 0 0 12px;

            font-family: 'Space Grotesk', sans-serif;

            font-size: 25px;
            line-height: 1.2;

            max-width: 245px;
        }

        .badge {
            position: relative;
            z-index: 2;

            display: inline-block;

            padding: 7px 10px;

            border-radius: 7px;

            font-size: 10px;
            font-weight: 800;

            letter-spacing: .7px;
        }

        .badge-primary {
            background: rgba(217,246,127,.15);
            color: var(--mint);

            border: 1px solid rgba(217,246,127,.2);
        }

        .ej-card-description {
            position: relative;
            z-index: 2;

            margin: 22px 0 0;

            color: #aeb9b4;

            font-size: 13px;
            line-height: 1.7;
        }

        .ej-tip {
            position: absolute;
            z-index: 2;

            bottom: 25px;
            left: 27px;
            right: 27px;

            padding-top: 18px;

            border-top: 1px solid rgba(255,255,255,.1);

            display: flex;
            align-items: flex-start;
            gap: 9px;

            color: #c7d0cc;

            font-size: 11.5px;
            line-height: 1.5;
        }

        .ej-tip i {
            color: var(--mint);
            margin-top: 2px;
        }

        /* =====================================================
           FORM CARD
        ===================================================== */

        .ej-form-card {
            background: white;

            border: 1px solid var(--line);

            border-radius: 22px;

            padding: 30px 32px;

            box-shadow: 0 15px 35px rgba(19, 33, 30, .06);

            animation: cardIn .55s .08s ease both;
        }

        .ej-form-title {
            margin: 0;

            display: flex;
            align-items: center;
            gap: 10px;

            font-family: 'Space Grotesk', sans-serif;

            font-size: 19px;
            letter-spacing: -.3px;
        }

        .ej-form-title i {
            width: 35px;
            height: 35px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 9px;

            background: #edf2e8;
            color: var(--ink);

            font-size: 14px;
        }

        .ej-form-subtitle {
            margin: 8px 0 27px 45px;

            color: var(--muted);

            font-size: 12.5px;
        }

        /* =====================================================
           FORM
        ===================================================== */

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;

            margin-bottom: 8px;

            font-size: 12.5px;
            font-weight: 700;

            color: #34443f;
        }

        .required {
            color: var(--coral);
        }

        .form-group input,
        .form-group textarea {
            width: 100%;

            border: 1px solid #d7ded5;

            background: #fbfcfa;

            color: var(--ink);

            border-radius: 10px;

            padding: 13px 14px;

            font-family: 'DM Sans', sans-serif;

            font-size: 14px;

            outline: none;

            transition:
                border-color .2s ease,
                box-shadow .2s ease,
                background .2s ease;
        }

        .form-group input {
            height: 48px;
        }

        .form-group textarea {
            min-height: 135px;

            resize: vertical;

            line-height: 1.6;
        }

        .form-group input:hover,
        .form-group textarea:hover {
            border-color: #bbc6bc;
            background: white;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: var(--ink);

            background: white;

            box-shadow: 0 0 0 3px rgba(217,246,127,.42);
        }

        /* =====================================================
           FIELD HELP
        ===================================================== */

        .field-help {
            display: block;

            margin-top: 6px;

            color: #87928d;

            font-size: 11px;
        }

        /* =====================================================
           FORM FOOTER
        ===================================================== */

        .ej-form-footer {
            margin-top: 27px;
            padding-top: 20px;

            border-top: 1px solid #e4e8e1;

            display: flex;
            align-items: center;
            justify-content: space-between;

            gap: 15px;
        }

        .ej-save-note {
            display: flex;
            align-items: center;
            gap: 8px;

            color: #74817b;

            font-size: 11.5px;
        }

        .ej-save-note i {
            color: #6e9c42;
        }

        .ej-submit-btn {
            border: none;

            background: var(--ink);
            color: white;

            padding: 13px 21px;

            border-radius: 10px;

            font-family: 'DM Sans', sans-serif;

            font-size: 13px;
            font-weight: 700;

            cursor: pointer;

            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 9px;

            transition:
                transform .2s ease,
                box-shadow .2s ease,
                background .2s ease;
        }

        .ej-submit-btn:hover {
            background: #1d302b;

            transform: translateY(-2px);

            box-shadow: 0 9px 22px rgba(19,33,30,.17);
        }

        .ej-submit-btn:active {
            transform: translateY(0);
        }

        /* =====================================================
           ANIMATION
        ===================================================== */

        @keyframes cardIn {

            from {
                opacity: 0;
                transform: translateY(12px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }

        }

        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width: 1000px) {

            .sidebar {
                width: 220px;
            }

            .main-content {
                margin-left: 220px;
                padding-left: 25px;
                padding-right: 25px;
            }

            .ej-container {
                grid-template-columns: 1fr;
            }

            .ej-profile-card {
                min-height: auto;
            }

            .ej-tip {
                position: relative;
                left: auto;
                right: auto;
                bottom: auto;

                margin-top: 25px;
            }

        }

        @media (max-width: 700px) {

            .sidebar {
                position: relative;

                width: 100%;
                height: auto;

                padding: 15px;
            }

            .sidebar-logo {
                padding-bottom: 15px;
            }

            .sidebar-nav {
                flex-direction: row;
                flex-wrap: wrap;
            }

            .sidebar-nav a {
                padding: 9px 10px;
                font-size: 12px;
            }

            .nav-divider {
                display: none;
            }

            .main-content {
                margin-left: 0;

                padding: 0 15px 40px;
            }

            .topbar {
                min-height: 70px;
            }

            .topbar-left h1 {
                font-size: 20px;
            }

            .topbar-right {
                display: none;
            }

            .ej-page-header {
                margin-top: 25px;

                align-items: flex-start;
                flex-direction: column;
            }

            .back-btn {
                display: inline-flex;
            }

            .ej-page-title {
                font-size: 27px;
            }

            .ej-form-card {
                padding: 23px 19px;
            }

            .ej-form-footer {
                align-items: stretch;
                flex-direction: column;
            }

            .ej-submit-btn {
                width: 100%;
            }

        }

    </style>

</head>


<body>


<!-- =====================================================
     SIDEBAR
===================================================== -->

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

        <a href="recruiter-dashboard.jsp">
            <i class="fa-solid fa-gauge"></i>
            Dashboard
        </a>

        <a href="recruiter-profile.jsp">
            <i class="fa-solid fa-user-tie"></i>
            Profile
        </a>

        <a href="postedjobs" class="active">
            <i class="fa-solid fa-list-ul"></i>
            My Jobs
        </a>

        <a href="home.jsp">
            <i class="fa-solid fa-house"></i>
            Home
        </a>

        <div class="nav-divider"></div>

        <a href="logout" class="logout-link">
            <i class="fa-solid fa-right-from-bracket"></i>
            Logout
        </a>

    </nav>

</div>



<!-- =====================================================
     MAIN CONTENT
===================================================== -->

<div class="main-content">


    <!-- TOP BAR -->

    <div class="topbar">

        <div class="topbar-left">

            <h1>Edit Job</h1>

        </div>

        <div class="topbar-right">

            <a href="postedjobs"
               class="btn btn-secondary btn-sm">

                <i class="fa-solid fa-arrow-left"></i>

                Back to My Jobs

            </a>

        </div>

    </div>



    <!-- PAGE HEADER -->

    <div class="ej-page-header">

        <div>

            <div class="ej-eyebrow">

                <i class="fa-solid fa-pen-to-square"></i>

                Job Listing Management

            </div>

            <h2 class="ej-page-title">

                Edit your job listing

            </h2>

            <p class="ej-page-description">

                Keep your vacancy details accurate and up to date.
                Changes will be reflected in the job listing viewed by candidates.

            </p>

        </div>


        <a href="postedjobs"
           class="btn btn-secondary btn-sm back-btn">

            <i class="fa-solid fa-arrow-left"></i>

            Back to My Jobs

        </a>

    </div>



    <!-- CONTENT -->

    <div class="ej-container">


        <!-- =================================================
             LEFT INFORMATION CARD
        ================================================== -->

        <div class="ej-profile-card">

            <div class="ej-card-label">
                Current Job Listing
            </div>


            <div class="ej-job-circle">

                <i class="fa-solid fa-briefcase"></i>

            </div>


            <h2>
                ${job.title}
            </h2>


            <span class="badge badge-primary">
                JOB DETAILS
            </span>


            <p class="ej-card-description">

                You're updating an active job listing.
                Make sure the role, location, salary and description
                accurately represent the opportunity you're offering.

            </p>


            <div class="ej-tip">

                <i class="fa-solid fa-circle-info"></i>

                <span>
                    Clear and accurate job information helps candidates
                    understand the role and apply with confidence.
                </span>

            </div>

        </div>



        <!-- =================================================
             RIGHT FORM
        ================================================== -->

        <div class="ej-form-card">


            <h3 class="ej-form-title">

                <i class="fa-solid fa-pen-to-square"></i>

                Update Job Details

            </h3>


            <p class="ej-form-subtitle">

                Review the information below and save your changes.

            </p>


            <form action="editjobs" method="post">


                <input type="hidden"
                       name="id"
                       value="${job.id}">



                <!-- JOB TITLE -->

                <div class="form-group">

                    <label for="ejTitle">

                        Job Title

                        <span class="required">*</span>

                    </label>

                    <input type="text"
                           id="ejTitle"
                           name="title"
                           value="${job.title}"
                           placeholder="e.g. Java Developer"
                           required>

                    <span class="field-help">
                        Use a clear title that candidates can easily understand.
                    </span>

                </div>



                <!-- LOCATION -->

                <div class="form-group">

                    <label for="ejLocation">

                        Location

                        <span class="required">*</span>

                    </label>

                    <input type="text"
                           id="ejLocation"
                           name="location"
                           value="${job.location}"
                           placeholder="e.g. Pune, Maharashtra"
                           required>

                    <span class="field-help">
                        Mention the primary work location or remote arrangement.
                    </span>

                </div>



                <!-- SALARY -->

                <div class="form-group">

                    <label for="ejSalary">

                        Salary

                        <span class="required">*</span>

                    </label>

                    <input type="text"
                           id="ejSalary"
                           name="salary"
                           value="${job.salary}"
                           placeholder="e.g. 600000"
                           required>

                    <span class="field-help">
                        Enter the annual compensation offered for this position.
                    </span>

                </div>



                <!-- DESCRIPTION -->

                <div class="form-group">

                    <label for="ejDesc">

                        Job Description

                        <span class="required">*</span>

                    </label>

                    <textarea id="ejDesc"
                              name="description"
                              rows="6"
                              placeholder="Describe the role, responsibilities, skills and expectations..."
                              required>${job.description}</textarea>

                    <span class="field-help">
                        A detailed description helps candidates decide whether the role is right for them.
                    </span>

                </div>



                <!-- FORM FOOTER -->

                <div class="ej-form-footer">

                    <div class="ej-save-note">

                        <i class="fa-solid fa-shield-halved"></i>

                        Your changes are saved securely.

                    </div>


                    <button type="submit"
                            class="ej-submit-btn">

                        <i class="fa-solid fa-floppy-disk"></i>

                        Save Job Changes

                    </button>

                </div>


            </form>

        </div>

    </div>

</div>


</body>

</html>