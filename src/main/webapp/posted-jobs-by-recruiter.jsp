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

    <title>My Posted Jobs | SMARTHIRE</title>

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

            --green: #3d765b;
            --green-soft: #edf7f0;

            --red: #b85c51;
            --red-soft: #fff0ed;

            --blue: #527f9e;
            --blue-soft: #edf3f6;

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


        button,
        input {
            font-family: inherit;
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


        .topbar-title {
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


        .post-top-btn {
            background: var(--ink);

            border-color: var(--ink);

            color: white;
        }


        .post-top-btn:hover {
            background: #263a35;

            border-color: #263a35;

            color: white;
        }


        /* =========================================
           PAGE INTRO
        ========================================= */

        .page-intro {
            position: relative;

            margin-top: 27px;

            padding: 28px;

            overflow: hidden;

            border-radius: 18px;

            background: var(--ink);

            color: white;

            box-shadow: var(--shadow);

            animation: fadeUp 0.5s ease both;
        }


        .page-intro::before {
            content: "";

            position: absolute;

            width: 250px;
            height: 250px;

            right: -100px;
            top: -145px;

            border: 1px solid rgba(217, 246, 127, 0.16);

            border-radius: 50%;
        }


        .page-intro::after {
            content: "";

            position: absolute;

            width: 150px;
            height: 150px;

            right: 65px;
            bottom: -110px;

            border: 1px solid rgba(255, 255, 255, 0.08);

            border-radius: 50%;
        }


        .intro-content {
            position: relative;

            z-index: 1;
        }


        .eyebrow {
            display: inline-flex;
            align-items: center;

            gap: 7px;

            margin-bottom: 9px;

            color: var(--mint);

            font-size: 8px;
            font-weight: 800;

            letter-spacing: 1.2px;

            text-transform: uppercase;
        }


        .eyebrow i {
            font-size: 7px;
        }


        .page-intro h2 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 27px;

            line-height: 1.15;

            letter-spacing: -1px;
        }


        .page-intro p {
            max-width: 570px;

            margin-top: 8px;

            color: #aebbb5;

            font-size: 11px;

            line-height: 1.6;
        }


        /* =========================================
           COUNT BANNER
        ========================================= */

        .count-banner {
            display: flex;
            align-items: center;

            gap: 14px;

            margin-top: 18px;

            padding: 16px 18px;

            border: 1px solid var(--line);

            border-radius: 14px;

            background: white;

            box-shadow:
                0 7px 22px rgba(19, 33, 30, 0.035);

            animation: fadeUp 0.55s ease both;
        }


        .count-icon {
            width: 43px;
            height: 43px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 11px;

            background: #edf1e9;

            color: var(--ink);

            font-size: 15px;
        }


        .count-num {
            font-family: "Space Grotesk", sans-serif;

            font-size: 21px;

            line-height: 1;

            letter-spacing: -0.6px;
        }


        .count-label {
            margin-top: 4px;

            color: var(--muted);

            font-size: 9px;
        }


        .count-banner .post-btn {
            min-height: 38px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 7px;

            margin-left: auto;

            padding: 0 14px;

            border-radius: 9px;

            background: var(--mint);

            color: var(--ink);

            font-size: 9px;
            font-weight: 800;

            transition: 0.22s ease;
        }


        .count-banner .post-btn:hover {
            transform: translateY(-1px);

            box-shadow:
                0 7px 17px rgba(19, 33, 30, 0.11);
        }


        /* =========================================
           CONTENT
        ========================================= */

        .content {
            margin-top: 23px;
        }


        .section-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;

            margin-bottom: 13px;
        }


        .section-heading h3 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 15px;

            letter-spacing: -0.3px;
        }


        .section-heading span {
            color: var(--muted);

            font-size: 9px;
        }


        /* =========================================
           JOB GRID
        ========================================= */

        .jobs-container {
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

            overflow: hidden;

            border: 1px solid var(--line);

            border-radius: 16px;

            background: white;

            box-shadow:
                0 7px 24px rgba(19, 33, 30, 0.035);

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

            border-color: #c7d0c6;

            box-shadow: var(--shadow);
        }


        .job-card:hover::before {
            opacity: 1;
        }


        .job-header {
            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 20px 20px 16px;
        }


        .job-left {
            display: flex;
            align-items: flex-start;

            gap: 12px;

            min-width: 0;
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
        }


        .job-title {
            overflow: hidden;

            font-family: "Space Grotesk", sans-serif;

            font-size: 16px;

            line-height: 1.3;

            letter-spacing: -0.4px;

            text-overflow: ellipsis;

            white-space: nowrap;
        }


        .job-status {
            display: inline-flex;
            align-items: center;

            gap: 5px;

            margin-top: 7px;

            padding: 4px 7px;

            border-radius: 5px;

            background: var(--green-soft);

            color: var(--green);

            font-size: 7px;
            font-weight: 800;

            letter-spacing: 0.4px;

            text-transform: uppercase;
        }


        .job-status i {
            font-size: 5px;
        }


        /* =========================================
           JOB BODY
        ========================================= */

        .job-body {
            padding: 0 20px 18px;
        }


        .meta {
            display: flex;
            flex-wrap: wrap;

            gap: 7px;
        }


        .meta span {
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


        .meta span i {
            color: #89958f;

            font-size: 8px;
        }


        .description {
            display: -webkit-box;

            margin-top: 15px;

            color: #6d7973;

            font-size: 10px;

            line-height: 1.6;

            overflow: hidden;

            -webkit-box-orient: vertical;

            -webkit-line-clamp: 3;
        }


        .description strong {
            color: #46544d;

            font-weight: 700;
        }


        /* =========================================
           ACTIONS
        ========================================= */

        .job-actions {
            display: grid;

            grid-template-columns:
                0.8fr 0.8fr 1.4fr;

            gap: 7px;

            margin-top: auto;

            padding: 14px 20px 19px;

            border-top: 1px solid #edf0eb;
        }


        .action-btn {
            min-height: 38px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 6px;

            border-radius: 8px;

            font-size: 8px;
            font-weight: 700;

            transition: 0.22s ease;
        }


        .edit-btn {
            border: 1px solid var(--line);

            background: #fafbf8;

            color: #58655e;
        }


        .edit-btn:hover {
            border-color: #b9c5bc;

            background: white;

            color: var(--ink);

            transform: translateY(-1px);
        }


        .delete-btn {
            border: 1px solid #efd4cf;

            background: var(--red-soft);

            color: var(--red);

            cursor: pointer;
        }


        .delete-btn:hover {
            border-color: #e5b8b0;

            background: #ffe8e3;

            transform: translateY(-1px);
        }


        .applicants-btn {
            border: 1px solid var(--ink);

            background: var(--ink);

            color: white;
        }


        .applicants-btn:hover {
            background: #263a35;

            border-color: #263a35;

            transform: translateY(-1px);

            box-shadow:
                0 7px 16px rgba(19, 33, 30, 0.12);
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
            max-width: 420px;

            margin: 8px auto 0;

            color: var(--muted);

            font-size: 11px;

            line-height: 1.55;
        }


        .empty-post-btn {
            min-height: 39px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 7px;

            margin-top: 17px;

            padding: 0 15px;

            border-radius: 9px;

            background: var(--ink);

            color: white;

            font-size: 9px;
            font-weight: 700;

            transition: 0.22s ease;
        }


        .empty-post-btn:hover {
            background: #263a35;

            transform: translateY(-1px);
        }


        /* =========================================
           DELETE MODAL
        ========================================= */

        .modal-backdrop {
            position: fixed;

            inset: 0;

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 20px;

            background: rgba(19, 33, 30, 0.48);

            backdrop-filter: blur(5px);

            opacity: 0;
            visibility: hidden;

            z-index: 500;

            transition:
                opacity 0.25s ease,
                visibility 0.25s ease;
        }


        .modal-backdrop.is-open {
            opacity: 1;

            visibility: visible;
        }


        .confirm-modal {
            position: relative;

            width: min(430px, 100%);

            padding: 28px;

            border: 1px solid #d8ded5;

            border-radius: 18px;

            background: white;

            box-shadow:
                0 30px 80px rgba(19, 33, 30, 0.22);

            transform: translateY(12px) scale(0.98);

            transition: transform 0.25s ease;
        }


        .modal-backdrop.is-open .confirm-modal {
            transform: translateY(0) scale(1);
        }


        .modal-close {
            position: absolute;

            top: 15px;
            right: 15px;

            width: 32px;
            height: 32px;

            border: 1px solid var(--line);

            border-radius: 8px;

            background: #fafbf8;

            color: #68756e;

            font-size: 18px;

            line-height: 1;

            cursor: pointer;

            transition: 0.2s ease;
        }


        .modal-close:hover {
            background: #f0f2ed;

            color: var(--ink);
        }


        .modal-icon {
            width: 48px;
            height: 48px;

            display: flex;
            align-items: center;
            justify-content: center;

            margin-bottom: 16px;

            border-radius: 13px;

            background: var(--red-soft);

            color: var(--red);

            font-size: 16px;
        }


        .modal-eyebrow {
            display: block;

            margin-bottom: 6px;

            color: var(--red);

            font-size: 8px;
            font-weight: 800;

            letter-spacing: 1px;

            text-transform: uppercase;
        }


        .confirm-modal h2 {
            font-family: "Space Grotesk", sans-serif;

            font-size: 20px;

            letter-spacing: -0.5px;
        }


        .modal-copy {
            margin-top: 8px;

            color: var(--muted);

            font-size: 10px;

            line-height: 1.6;
        }


        .modal-actions {
            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 8px;

            margin-top: 21px;
        }


        .modal-btn {
            min-height: 40px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 9px;

            font-size: 9px;
            font-weight: 700;

            cursor: pointer;

            transition: 0.22s ease;
        }


        .keep-btn {
            border: 1px solid var(--line);

            background: #fafbf8;

            color: #59665f;
        }


        .keep-btn:hover {
            border-color: #bac5bc;

            background: white;
        }


        .confirm-delete-btn {
            border: 1px solid var(--red);

            background: var(--red);

            color: white;
        }


        .confirm-delete-btn:hover {
            background: #a94e44;

            border-color: #a94e44;

            transform: translateY(-1px);
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

            .jobs-container {
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


            .page-intro h2 {
                font-size: 24px;
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


            .page-intro {
                padding: 23px;
            }


            .count-banner {
                flex-wrap: wrap;
            }


            .count-banner .post-btn {
                width: 100%;

                margin-left: 0;
            }


            .job-actions {
                grid-template-columns: 1fr 1fr;
            }


            .applicants-btn {
                grid-column: 1 / -1;
            }

        }


        @media (max-width: 450px) {

            .sidebar-nav {
                grid-template-columns: 1fr;
            }


            .topbar-title {
                font-size: 19px;
            }


            .page-intro h2 {
                font-size: 22px;
            }


            .job-header,
            .job-body {
                padding-left: 17px;
                padding-right: 17px;
            }


            .job-actions {
                padding-left: 17px;
                padding-right: 17px;
            }


            .meta {
                flex-direction: column;
            }


            .meta span {
                width: 100%;
            }


            .job-actions {
                grid-template-columns: 1fr;
            }


            .applicants-btn {
                grid-column: auto;
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

            <span>Recruiter Portal</span>

        </div>

    </div>


    <nav class="sidebar-nav">


        <a
            href="${pageContext.request.contextPath}/recruiter-dashboard.jsp">

            <i class="fa-solid fa-gauge"></i>

            <span>Dashboard</span>

        </a>


        <a
            href="${pageContext.request.contextPath}/post-job.jsp">

            <i class="fa-solid fa-plus"></i>

            <span>Post Job</span>

        </a>


        <a
            href="${pageContext.request.contextPath}/postedjobs"
            class="active">

            <i class="fa-solid fa-list-ul"></i>

            <span>Posted Jobs</span>

        </a>


        <a
            href="${pageContext.request.contextPath}/recruiterprofile">

            <i class="fa-solid fa-user-tie"></i>

            <span>Profile</span>

        </a>


        <a
            href="${pageContext.request.contextPath}/home.jsp">

            <i class="fa-solid fa-house"></i>

            <span>Home</span>

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
     MAIN
========================================= -->

<div class="main-content">


    <!-- TOPBAR -->

    <div class="topbar">


        <div class="topbar-left">


            <a
                href="${pageContext.request.contextPath}/recruiter-dashboard.jsp"
                class="back-btn">

                <i class="fa-solid fa-arrow-left"></i>

            </a>


            <h1 class="topbar-title">
                My Posted Jobs
            </h1>


        </div>


        <div class="topbar-right">


            <a
                href="${pageContext.request.contextPath}/post-job.jsp"
                class="topbar-btn post-top-btn">

                <i class="fa-solid fa-plus"></i>

                Post Job

            </a>


            <a
                href="${pageContext.request.contextPath}/recruiter-dashboard.jsp"
                class="topbar-btn">

                Dashboard

            </a>


        </div>


    </div>


    <!-- =========================================
         INTRO
    ========================================= -->

    <section class="page-intro">


        <div class="intro-content">


            <div class="eyebrow">

                <i class="fa-solid fa-layer-group"></i>

                Recruitment Workspace

            </div>


            <h2>
                Manage your job postings.
            </h2>


            <p>
                Keep track of your active opportunities, review applicants,
                and manage every position from one place.
            </p>


        </div>


    </section>


    <!-- =========================================
         COUNT
    ========================================= -->

    <div class="count-banner">


        <div class="count-icon">

            <i class="fa-solid fa-briefcase"></i>

        </div>


        <div>

            <div class="count-num">
                ${jobs.size()}
            </div>

            <div class="count-label">
                Total Jobs Posted
            </div>

        </div>


        <a
            href="${pageContext.request.contextPath}/post-job.jsp"
            class="post-btn">

            <i class="fa-solid fa-plus"></i>

            Post New Job

        </a>


    </div>


    <!-- =========================================
         JOB CONTENT
    ========================================= -->

    <div class="content">


        <c:if test="${not empty jobs}">


            <div class="section-heading">


                <h3>
                    Your Job Listings
                </h3>


                <span>
                    Manage active opportunities
                </span>


            </div>


        </c:if>


        <!-- EMPTY STATE -->

        <c:if test="${empty jobs}">


            <div class="empty-state">


                <div class="empty-icon">

                    <i class="fa-solid fa-briefcase"></i>

                </div>


                <h3>
                    No Jobs Posted Yet
                </h3>


                <p>
                    Start posting jobs to attract qualified candidates
                    and build your recruitment pipeline.
                </p>


                <a
                    href="${pageContext.request.contextPath}/post-job.jsp"
                    class="empty-post-btn">

                    <i class="fa-solid fa-plus"></i>

                    Post First Job

                </a>


            </div>


        </c:if>


        <!-- JOB LIST -->

        <c:if test="${not empty jobs}">


            <div class="jobs-container">


                <c:forEach
                    var="job"
                    items="${jobs}">


                    <div class="job-card">


                        <!-- HEADER -->

                        <div class="job-header">


                            <div class="job-left">


                                <div class="job-logo">

                                    <i class="fa-solid fa-briefcase"></i>

                                </div>


                                <div class="job-title-area">


                                    <h2 class="job-title">
                                        ${job.title}
                                    </h2>


                                    <span class="job-status">

                                        <i class="fa-solid fa-circle"></i>

                                        Active

                                    </span>


                                </div>


                            </div>


                        </div>


                        <!-- BODY -->

                        <div class="job-body">


                            <div class="meta">


                                <span>

                                    <i class="fa-solid fa-hashtag"></i>

                                    ID: ${job.id}

                                </span>


                                <span>

                                    <i class="fa-solid fa-location-dot"></i>

                                    ${job.location}

                                </span>


                                <span>

                                    <i class="fa-solid fa-indian-rupee-sign"></i>

                                    ${job.salary}

                                </span>


                            </div>


                            <p class="description">


                                <strong>
                                    Description:
                                </strong>


                                ${job.description}


                            </p>


                        </div>


                        <!-- ACTIONS -->

                        <div class="job-actions">


                            <a
                                href="${pageContext.request.contextPath}/fetchjob?id=${job.id}"
                                class="action-btn edit-btn">

                                <i class="fa-solid fa-pen"></i>

                                Edit

                            </a>


                            <a
                                href="${pageContext.request.contextPath}/deletejob?id=${job.id}"
                                class="action-btn delete-btn"
                                data-delete-job="true"
                                data-job-title="${job.title}">

                                <i class="fa-solid fa-trash"></i>

                                Delete

                            </a>


                            <a
                                href="${pageContext.request.contextPath}/viewapplicants?jobId=${job.id}"
                                class="action-btn applicants-btn">

                                <i class="fa-solid fa-users"></i>

                                View Applicants

                            </a>


                        </div>


                    </div>


                </c:forEach>


            </div>


        </c:if>


    </div>


</div>


<!-- =========================================
     DELETE MODAL
========================================= -->

<div
    class="modal-backdrop"
    id="deleteModal"
    aria-hidden="true">


    <div
        class="confirm-modal"
        role="dialog"
        aria-modal="true"
        aria-labelledby="deleteModalTitle">


        <button
            class="modal-close"
            type="button"
            data-modal-close
            aria-label="Close">

            &times;

        </button>


        <div class="modal-icon">

            <i class="fa-solid fa-trash-can"></i>

        </div>


        <span class="modal-eyebrow">
            Permanent Action
        </span>


        <h2 id="deleteModalTitle">
            Delete this job post?
        </h2>


        <p
            class="modal-copy"
            id="deleteModalCopy">

            This job and its applicant connections will be removed.

        </p>


        <div class="modal-actions">


            <button
                type="button"
                class="modal-btn keep-btn"
                data-modal-close>

                Keep Job

            </button>


            <a
                class="modal-btn confirm-delete-btn"
                id="deleteModalConfirm"
                href="#">

                Delete Job

            </a>


        </div>


    </div>

</div>


<!-- =========================================
     MODAL SCRIPT
========================================= -->

<script>

(function () {

    const modal =
        document.getElementById("deleteModal");

    const copy =
        document.getElementById("deleteModalCopy");

    const confirmLink =
        document.getElementById("deleteModalConfirm");


    const closeModal = () => {

        modal.classList.remove("is-open");

        modal.setAttribute(
            "aria-hidden",
            "true"
        );

    };


    document
        .querySelectorAll("[data-delete-job]")
        .forEach((link) => {

            link.addEventListener("click", (event) => {

                event.preventDefault();


                const jobTitle =
                    link.dataset.jobTitle;


                copy.textContent =
                    `Delete "${jobTitle}"? This action cannot be undone.`;


                confirmLink.href =
                    link.href;


                modal.classList.add("is-open");


                modal.setAttribute(
                    "aria-hidden",
                    "false"
                );


                confirmLink.focus();

            });

        });


    document
        .querySelectorAll("[data-modal-close]")
        .forEach((button) => {

            button.addEventListener(
                "click",
                closeModal
            );

        });


    modal.addEventListener(
        "click",
        (event) => {

            if (event.target === modal) {

                closeModal();

            }

        }
    );


    document.addEventListener(
        "keydown",
        (event) => {

            if (event.key === "Escape") {

                closeModal();

            }

        }
    );


})();

</script>


</body>

</html>