<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <meta
      name="description"
      content="SMARTHIRE - Discover meaningful careers, connect with trusted companies and find your next opportunity."
    />

    <meta name="theme-color" content="#13211e" />

    <title>SMARTHIRE — Find Work That Moves You</title>

    <link rel="icon" type="image/svg+xml" href="favicon.svg" />

    <!-- =====================================================
         GOOGLE FONTS
         ===================================================== -->

    <link rel="preconnect" href="https://fonts.googleapis.com" />

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link
      href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- =====================================================
         FONT AWESOME
         ===================================================== -->

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    />

    <!-- =====================================================
         EXISTING SMART SEARCH
         ===================================================== -->

    <link rel="stylesheet" href="css/home.css" />

    <!-- =====================================================
         SMARTHIRE HOME PAGE
         ===================================================== -->

    <style>
      /* =====================================================
           ROOT
           ===================================================== */

      :root {
        --ink: #13211e;
        --ink-soft: #1d302b;

        --mint: #d9f67f;
        --mint-soft: #eaf9ba;

        --coral: #f27961;
        --coral-soft: #fde1da;

        --paper: #f4f1e8;
        --paper-dark: #ebe7dc;

        --white: #ffffff;

        --line: #d6ddd1;
        --line-dark: #bdc8bd;

        --muted: #ced1d0;
        --muted-light: #8b9690;

        --green: #69a85b;

        --shadow-sm: 0 8px 24px rgba(19, 33, 30, 0.05);

        --shadow-md: 0 18px 45px rgba(19, 33, 30, 0.08);

        --shadow-lg: 0 30px 80px rgba(19, 33, 30, 0.12);

        --radius-sm: 12px;
        --radius-md: 18px;
        --radius-lg: 28px;

        --container: 1240px;
      }

      /* =====================================================
           RESET
           ===================================================== */

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      html {
        scroll-behavior: smooth;
      }

      body {
        min-height: 100vh;

        background: var(--paper);

        color: var(--ink);

        font-family: "DM Sans", sans-serif;

        overflow-x: hidden;

        -webkit-font-smoothing: antialiased;
      }

      a {
        color: inherit;
      }

      button,
      input,
      select {
        font-family: inherit;
      }

      ::selection {
        background: var(--mint);
        color: var(--ink);
      }

      /* =====================================================
           CONTAINER
           ===================================================== */

      .container {
        width: min(calc(100% - 48px), var(--container));

        margin: 0 auto;
      }

      /* =====================================================
           ANNOUNCEMENT BAR
           ===================================================== */

      .announcement {
        min-height: 38px;

        background: var(--ink);

        color: rgba(255, 255, 255, 0.82);

        display: flex;

        align-items: center;

        justify-content: center;

        padding: 8px 20px;

        font-size: 11px;

        font-weight: 600;

        letter-spacing: 0.3px;
      }

      .announcement-inner {
        display: flex;

        align-items: center;

        justify-content: center;

        gap: 9px;

        text-align: center;
      }

      .announcement-dot {
        width: 6px;
        height: 6px;

        border-radius: 50%;

        background: var(--mint);

        box-shadow: 0 0 0 4px rgba(217, 246, 127, 0.1);
      }

      .announcement strong {
        color: var(--mint);
      }

      /* =====================================================
           NAVBAR
           ===================================================== */

      .navbar {
        position: sticky;

        top: 0;

        z-index: 100;

        height: 76px;

        background: rgba(244, 241, 232, 0.94);

        backdrop-filter: blur(18px);

        -webkit-backdrop-filter: blur(18px);

        border-bottom: 1px solid var(--line);
      }

      .navbar-inner {
        height: 100%;

        display: flex;

        align-items: center;

        justify-content: space-between;
      }

      /* =====================================================
           LOGO
           ===================================================== */

      .logo {
        display: inline-flex;

        align-items: center;

        gap: 10px;

        text-decoration: none;

        font-family: "Space Grotesk", sans-serif;

        font-size: 23px;

        font-weight: 700;

        letter-spacing: -1.1px;

        color: var(--ink);
      }

      .logo-icon {
        width: 38px;
        height: 38px;

        display: flex;

        align-items: center;
        justify-content: center;

        background: var(--mint);

        border-radius: 10px;

        font-size: 15px;

        transition: transform 0.25s ease;
      }

      .logo:hover .logo-icon {
        transform: rotate(-8deg) scale(1.05);
      }

      /* =====================================================
           NAV LINKS
           ===================================================== */

      .nav-links {
        display: flex;

        align-items: center;
        justify-content: space-between;

        gap: 16px;
      }

      .nav-links a {
        position: relative;

        text-decoration: none;

        padding: 18px 20px;

        color: #52605a;

        font-size: 18px;

        font-weight: 800;

        border-radius: 12px;

        transition:
          color 0.2s ease,
          background 0.2s ease;
      }

      .nav-links a:hover {
        color: var(--ink);

        background: rgba(255, 255, 255, 0.55);
      }

      .nav-links a.active {
        color: var(--ink);
      }

      .nav-links a.active::after {
        content: "";

        position: absolute;

        left: 14px;
        right: 16px;

        bottom: 7px;

        height: 3px;

        background: var(--coral);

        border-radius: 4px;
      }

      .register-btn {
        margin-left: 5px;

        background: var(--ink) !important;

        color: white !important;

        padding: 11px 17px !important;

        box-shadow: 0 7px 18px rgba(19, 33, 30, 0.1);
      }

      .register-btn:hover {
        transform: translateY(-2px);

        background: var(--ink-soft) !important;
      }

      /* =====================================================
           HERO
           ===================================================== */

      .hero {
        position: relative;

        min-height: 720px;

        display: flex;

        align-items: center;

        overflow: hidden;

        border-bottom: 1px solid var(--line);
      }

      .hero::before {
        content: "";

        position: absolute;

        width: 620px;
        height: 620px;

        border-radius: 50%;

        background: rgba(217, 246, 127, 0.17);

        top: -310px;

        right: -160px;

        pointer-events: none;
      }

      .hero::after {
        content: "";

        position: absolute;

        width: 420px;
        height: 420px;

        border-radius: 50%;

        border: 1px solid rgba(19, 33, 30, 0.07);

        bottom: -270px;

        left: -160px;

        pointer-events: none;
      }

      .hero-decoration {
        position: absolute;

        right: -55px;

        top: 145px;

        font-family: "Space Grotesk", sans-serif;

        font-size: clamp(90px, 13vw, 190px);

        font-weight: 700;

        line-height: 0.8;

        letter-spacing: -9px;

        color: rgba(19, 33, 30, 0.025);

        pointer-events: none;

        user-select: none;
      }

      .hero-inner {
        position: relative;

        z-index: 2;

        display: grid;

        grid-template-columns:
          minmax(0, 1.35fr)
          minmax(320px, 0.65fr);

        gap: 80px;

        align-items: center;

        padding: 80px 0 95px;
      }

      /* =====================================================
           HERO CONTENT
           ===================================================== */

      .hero-content {
        animation: heroEnter 0.8s ease both;
      }

      .hero-tag {
        display: inline-flex;

        align-items: center;

        gap: 9px;

        padding: 7px 11px 7px 8px;

        border: 1px solid var(--line);

        border-radius: 30px;

        background: rgba(255, 255, 255, 0.45);

        color: var(--muted);

        font-size: 11px;

        font-weight: 700;

        letter-spacing: 0.2px;

        margin-bottom: 24px;
      }

      .hero-tag span {
        width: 8px;
        height: 8px;

        border-radius: 50%;

        background: var(--green);

        box-shadow: 0 0 0 4px rgba(105, 168, 91, 0.11);
      }

      .hero h1 {
        max-width: 760px;

        font-family: "Space Grotesk", sans-serif;

        font-size: clamp(55px, 6.4vw, 92px);

        line-height: 0.94;

        letter-spacing: -5px;

        font-weight: 700;

        margin-bottom: 27px;
      }

      .hero h1 span {
        display: block;

        color: var(--coral);

        font-style: normal;
      }

      .hero-description {
        max-width: 590px;

        color: var(--muted);

        font-size: 16px;

        line-height: 1.75;

        margin-bottom: 35px;
      }

      /* =====================================================
           SEARCH BOX
           ===================================================== */

      .search-shell {
        position: relative;

        width: 100%;

        max-width: 910px;

        padding: 9px;

        border: 1px solid rgba(19, 33, 30, 0.12);

        border-radius: 18px;

        background: rgba(255, 255, 255, 0.72);

        box-shadow: 0 25px 55px rgba(19, 33, 30, 0.08);

        backdrop-filter: blur(12px);
      }

      .hero-search {
        display: flex;

        flex-direction: column;

        gap: 8px;
      }

      .search-keyword {
        min-height: 58px;

        display: flex;

        align-items: center;

        gap: 13px;

        padding: 0 18px;

        background: var(--white);

        border: 1px solid #e2e6df;

        border-radius: 12px;

        transition:
          border-color 0.2s ease,
          box-shadow 0.2s ease;
      }

      .search-keyword:focus-within {
        border-color: var(--line-dark);

        box-shadow: 0 0 0 4px rgba(217, 246, 127, 0.16);
      }

      .search-keyword i {
        color: var(--muted);

        font-size: 15px;
      }

      .search-keyword input {
        width: 100%;

        border: none;

        outline: none;

        background: transparent;

        color: var(--ink);

        font-size: 14px;

        font-weight: 500;
      }

      .search-keyword input::placeholder {
        color: #9aa39e;
      }

      .search-filters {
        display: grid;

        grid-template-columns: 1fr 1fr 1fr 1fr;

        gap: 8px;
      }

      .search-select {
        min-height: 49px;

        position: relative;

        background: rgba(255, 255, 255, 0.9);

        border: 1px solid #e2e6df;

        border-radius: 11px;

        overflow: visible;
      }

      .search-select select,
      .custom-select-input {
        width: 100%;

        height: 49px;

        border: none;

        outline: none;

        background: transparent;

        padding: 0 35px 0 14px;

        color: #53615b;

        font-size: 12px;

        font-weight: 600;

        appearance: none;

        cursor: pointer;
      }

      .select-arrow {
        position: absolute;

        right: 13px;

        top: 50%;

        transform: translateY(-50%);

        pointer-events: none;

        color: #89948e;

        font-size: 10px;
      }

      .custom-select {
        overflow: visible;
      }

      .custom-select-input {
        cursor: text;

        padding-right: 35px;
      }

      .custom-dropdown {
        display: none;

        position: absolute;

        z-index: 50;

        left: 0;
        right: 0;

        top: calc(100% + 7px);

        padding: 8px;

        background: var(--white);

        border: 1px solid var(--line);

        border-radius: 13px;

        box-shadow: var(--shadow-md);
      }

      .custom-select:focus-within .custom-dropdown {
        display: block;
      }

      .custom-search-box {
        display: flex;

        align-items: center;

        gap: 8px;

        padding: 9px 10px;

        border: 1px solid #e3e7e1;

        border-radius: 8px;

        margin-bottom: 6px;
      }

      .custom-search-box i {
        font-size: 10px;

        color: var(--muted);
      }

      .dropdown-search {
        width: 100%;

        border: none;

        outline: none;

        font-size: 11px;
      }

      .dropdown-options {
        max-height: 190px;

        overflow-y: auto;
      }

      .dropdown-option {
        padding: 9px 10px;

        border-radius: 7px;

        font-size: 12px;

        font-weight: 500;

        cursor: pointer;
      }

      .dropdown-option:hover {
        background: var(--paper);
      }

      .custom-value-option {
        margin-top: 5px;

        padding: 9px 10px;

        display: flex;

        gap: 8px;

        align-items: center;

        border-top: 1px solid var(--line);

        color: var(--coral);

        font-size: 11px;

        font-weight: 700;

        cursor: pointer;
      }

      .search-btn {
        min-height: 52px;

        border: none;

        border-radius: 11px;

        background: var(--ink);

        color: var(--white);

        font-size: 13px;

        font-weight: 700;

        display: flex;

        align-items: center;

        justify-content: center;

        gap: 9px;

        cursor: pointer;

        transition:
          transform 0.2s ease,
          box-shadow 0.2s ease;
      }

      .search-btn i {
        color: var(--mint);

        transition: transform 0.2s ease;
      }

      .search-btn:hover {
        transform: translateY(-2px);

        box-shadow: 0 12px 25px rgba(19, 33, 30, 0.18);
      }

      .search-btn:hover i {
        transform: translateX(4px);
      }

      /* =====================================================
           SEARCH META
           ===================================================== */

      .search-meta {
        display: flex;

        align-items: center;

        gap: 16px;

        margin-top: 13px;

        color: #8a958f;

        font-size: 10px;

        font-weight: 600;
      }

      .search-meta span {
        display: flex;

        align-items: center;

        gap: 5px;
      }

      .search-meta i {
        color: var(--green);
      }

      /* =====================================================
           HERO SIDE CARD
           ===================================================== */

      .hero-visual {
        position: relative;

        min-height: 475px;

        animation: visualEnter 0.9s 0.1s ease both;
      }

      .visual-card {
        position: absolute;

        right: 5px;

        top: 10px;

        width: min(100%, 385px);

        background: var(--ink);

        color: white;

        border-radius: 30px;

        padding: 29px;

        box-shadow: 0 35px 75px rgba(19, 33, 30, 0.18);

        transform: rotate(3deg);

        transition: transform 0.35s ease;
      }

      .visual-card:hover {
        transform: rotate(0deg) translateY(-7px);
      }

      .visual-card::before {
        content: "";

        position: absolute;

        width: 130px;
        height: 130px;

        border-radius: 50%;

        background: rgba(217, 246, 127, 0.13);

        right: -40px;

        top: -40px;
      }

      .visual-top {
        display: flex;

        justify-content: space-between;

        align-items: center;

        margin-bottom: 70px;
      }

      .featured-badge {
        padding: 7px 10px;

        border-radius: 20px;

        background: rgba(217, 246, 127, 0.12);

        color: var(--mint);

        font-size: 9px;

        font-weight: 700;

        letter-spacing: 1px;
      }

      .visual-menu {
        width: 34px;
        height: 34px;

        display: flex;

        align-items: center;
        justify-content: center;

        border-radius: 9px;

        background: rgba(255, 255, 255, 0.08);

        color: rgba(255, 255, 255, 0.7);
      }

      .visual-icon {
        width: 67px;
        height: 67px;

        display: flex;

        align-items: center;
        justify-content: center;

        border-radius: 19px;

        background: var(--mint);

        color: var(--ink);

        font-size: 29px;

        margin-bottom: 20px;
      }

      .visual-small {
        color: rgba(255, 255, 255, 0.48);

        font-size: 10px;

        font-weight: 600;

        text-transform: uppercase;

        letter-spacing: 1.2px;

        margin-bottom: 8px;
      }

      .visual-card h3 {
        font-family: "Space Grotesk", sans-serif;

        font-size: 31px;

        letter-spacing: -1.3px;

        margin-bottom: 17px;
      }

      .visual-info {
        display: flex;

        gap: 17px;

        flex-wrap: wrap;

        color: rgba(255, 255, 255, 0.64);

        font-size: 11px;
      }

      .visual-info span {
        display: flex;

        align-items: center;

        gap: 6px;
      }

      .visual-info i {
        color: var(--mint);
      }

      .visual-bottom {
        display: flex;

        align-items: center;

        justify-content: space-between;

        margin-top: 30px;

        padding-top: 20px;

        border-top: 1px solid rgba(255, 255, 255, 0.1);
      }

      .visual-bottom strong {
        font-family: "Space Grotesk", sans-serif;

        font-size: 19px;

        color: var(--mint);
      }

      .visual-bottom span {
        padding: 7px 10px;

        background: rgba(255, 255, 255, 0.07);

        border-radius: 7px;

        font-size: 10px;

        color: rgba(255, 255, 255, 0.7);
      }

      /* =====================================================
           FLOATING MINI CARDS
           ===================================================== */

      .float-card {
        position: absolute;

        background: rgba(255, 255, 255, 0.92);

        border: 1px solid rgba(19, 33, 30, 0.08);

        box-shadow: var(--shadow-md);

        border-radius: 15px;

        padding: 13px 15px;

        display: flex;

        align-items: center;

        gap: 11px;

        backdrop-filter: blur(10px);
      }

      .float-card-one {
        left: -5px;

        top: 95px;

        animation: floatA 5s ease-in-out infinite;
      }

      .float-card-two {
        right: -15px;

        bottom: 92px;

        animation: floatB 6s ease-in-out infinite;
      }

      .float-icon {
        width: 34px;
        height: 34px;

        display: flex;

        align-items: center;
        justify-content: center;

        border-radius: 9px;

        font-size: 13px;
      }

      .float-card-one .float-icon {
        background: var(--mint-soft);

        color: #617b25;
      }

      .float-card-two .float-icon {
        background: var(--coral-soft);

        color: var(--coral);
      }

      .float-text {
        display: flex;

        flex-direction: column;

        gap: 2px;
      }

      .float-text strong {
        font-size: 11px;
      }

      .float-text span {
        font-size: 9px;

        color: var(--muted);
      }

      /* =====================================================
           TRUST STRIP
           ===================================================== */

      .trust-strip {
        background: var(--white);

        border-bottom: 1px solid var(--line);
      }

      .trust-inner {
        min-height: 88px;

        display: flex;

        align-items: center;

        justify-content: space-between;

        gap: 30px;
      }

      .trust-copy {
        color: #8a958f;

        font-size: 10px;

        font-weight: 700;

        letter-spacing: 0.8px;

        white-space: nowrap;
      }

      .trust-companies {
        display: flex;

        align-items: center;

        justify-content: flex-end;

        gap: 38px;

        flex-wrap: wrap;
      }

      .trust-company {
        color: #6d7973;

        font-family: "Space Grotesk", sans-serif;

        font-size: 16px;

        font-weight: 700;

        opacity: 0.72;

        transition:
          opacity 0.2s ease,
          transform 0.2s ease;
      }

      .trust-company:hover {
        opacity: 1;

        transform: translateY(-2px);
      }

      /* =====================================================
           SECTION COMMON
           ===================================================== */

      section {
        position: relative;
      }

      .section-padding {
        padding: 110px 0;
      }

      .section-heading {
        display: flex;

        justify-content: space-between;

        align-items: flex-end;

        gap: 30px;

        margin-bottom: 43px;
      }

      .section-label {
        color: var(--coral);

        font-size: 10px;

        font-weight: 800;

        letter-spacing: 1.6px;

        margin-bottom: 10px;
      }

      .section-heading h2 {
        max-width: 680px;

        font-family: "Space Grotesk", sans-serif;

        font-size: clamp(34px, 4vw, 55px);

        line-height: 1.02;

        letter-spacing: -2.8px;
      }

      .section-heading p.description-small {
        max-width: 370px;

        color: var(--muted);

        font-size: 13px;

        line-height: 1.7;

        margin-bottom: 4px;
      }

      .section-link {
        display: inline-flex;

        align-items: center;

        gap: 8px;

        text-decoration: none;

        color: var(--ink);

        font-size: 12px;

        font-weight: 700;

        padding-bottom: 5px;

        border-bottom: 1px solid var(--ink);
      }

      .section-link i {
        transition: transform 0.2s ease;
      }

      .section-link:hover i {
        transform: translateX(4px);
      }

      /* =====================================================
           STATS
           ===================================================== */

      .stats-section {
        background: var(--ink);

        color: white;

        padding: 35px 0;
      }

      .stats-grid {
        display: grid;

        grid-template-columns: repeat(4, 1fr);
      }

      .stat {
        min-height: 95px;

        padding: 8px 35px;

        display: flex;

        flex-direction: column;

        justify-content: center;

        border-right: 1px solid rgba(255, 255, 255, 0.1);
      }

      .stat:first-child {
        padding-left: 0;
      }

      .stat:last-child {
        border-right: none;
      }

      .stat strong {
        font-family: "Space Grotesk", sans-serif;

        font-size: 37px;

        line-height: 1;

        letter-spacing: -1.5px;

        color: var(--mint);
      }

      .stat span {
        margin-top: 7px;

        color: rgba(255, 255, 255, 0.52);

        font-size: 10px;

        font-weight: 600;

        letter-spacing: 0.5px;

        text-transform: uppercase;
      }

      /* =====================================================
           FEATURED JOBS
           ===================================================== */

      .featured-section {
        background: var(--paper);
      }

      .jobs-grid {
        display: grid;

        grid-template-columns: repeat(3, 1fr);

        gap: 17px;
      }

      .job-card {
        position: relative;

        min-height: 340px;

        padding: 25px;

        display: flex;

        flex-direction: column;

        background: rgba(255, 255, 255, 0.58);

        border: 1px solid var(--line);

        border-radius: 20px;

        overflow: hidden;

        transition:
          transform 0.28s ease,
          box-shadow 0.28s ease,
          border-color 0.28s ease;
      }

      .job-card:hover {
        transform: translateY(-7px);

        box-shadow: var(--shadow-md);

        border-color: #c2ccc1;
      }

      .job-card::after {
        content: "OPEN";

        position: absolute;

        right: -23px;

        top: 27px;

        padding: 5px 28px;

        background: var(--mint);

        color: var(--ink);

        font-size: 8px;

        font-weight: 800;

        letter-spacing: 1px;

        transform: rotate(35deg);
      }

      .job-card-top {
        display: flex;

        justify-content: space-between;

        align-items: center;

        margin-bottom: 35px;
      }

      .job-icon {
        width: 50px;
        height: 50px;

        display: flex;

        align-items: center;
        justify-content: center;

        background: var(--white);

        border: 1px solid var(--line);

        border-radius: 13px;

        font-size: 22px;

        color: var(--ink);
      }

      .job-type {
        padding: 7px 10px;

        background: var(--paper-dark);

        border-radius: 20px;

        font-size: 9px;

        font-weight: 700;

        color: var(--muted);
      }

      .job-card h3 {
        font-family: "Space Grotesk", sans-serif;

        font-size: 24px;

        letter-spacing: -0.8px;

        margin-bottom: 9px;
      }

      .job-company {
        display: flex;

        align-items: center;

        gap: 7px;

        color: var(--muted);

        font-size: 11px;

        font-weight: 600;
      }

      .job-company i {
        color: var(--coral);
      }

      .job-details {
        display: flex;

        gap: 17px;

        margin-top: 22px;

        padding-top: 17px;

        border-top: 1px solid var(--line);

        color: var(--muted);

        font-size: 10px;
      }

      .job-details span {
        display: flex;

        align-items: center;

        gap: 6px;
      }

      .job-details i {
        color: var(--ink);

        opacity: 0.6;
      }

      .job-apply {
        margin-top: auto;

        padding-top: 23px;

        display: flex;

        align-items: center;

        justify-content: space-between;

        text-decoration: none;

        color: var(--ink);

        font-size: 11px;

        font-weight: 800;
      }

      .job-apply i {
        width: 31px;
        height: 31px;

        display: flex;

        align-items: center;
        justify-content: center;

        border: 1px solid var(--line);

        border-radius: 50%;

        transition:
          transform 0.2s ease,
          background 0.2s ease;
      }

      .job-card:hover .job-apply i {
        background: var(--mint);

        transform: translateX(3px);
      }

      /* =====================================================
           CATEGORIES
           ===================================================== */

      .categories-section {
        background: var(--white);

        border-top: 1px solid var(--line);

        border-bottom: 1px solid var(--line);
      }

      .categories-grid {
        display: grid;

        grid-template-columns: repeat(4, 1fr);

        gap: 12px;
      }

      .category-card {
        min-height: 145px;

        padding: 22px;

        display: flex;

        flex-direction: column;

        justify-content: space-between;

        border: 1px solid var(--line);

        border-radius: 16px;

        text-decoration: none;

        background: var(--paper);

        transition:
          transform 0.25s ease,
          background 0.25s ease,
          box-shadow 0.25s ease;
      }

      .category-card:hover {
        transform: translateY(-5px);

        background: var(--mint);

        box-shadow: var(--shadow-sm);
      }

      .category-icon {
        width: 39px;
        height: 39px;

        display: flex;

        align-items: center;
        justify-content: center;

        border-radius: 10px;

        background: var(--white);

        color: var(--ink);

        font-size: 14px;
      }

      .category-card h3 {
        font-family: "Space Grotesk", sans-serif;

        font-size: 16px;

        letter-spacing: -0.3px;
      }

      .category-card span {
        color: var(--muted);

        font-size: 9px;

        font-weight: 700;
      }

      /* =====================================================
           WHY SMARTHIRE
           ===================================================== */

      .why-section {
        background: var(--paper);
      }

      .why-grid {
        display: grid;

        grid-template-columns: 1fr 1fr;

        gap: 60px;

        align-items: center;
      }

      .why-visual {
        position: relative;

        min-height: 470px;

        border-radius: 28px;

        background: var(--ink);

        overflow: hidden;

        padding: 35px;
      }

      .why-visual::before {
        content: "";

        position: absolute;

        width: 300px;

        height: 300px;

        border-radius: 50%;

        background: rgba(217, 246, 127, 0.1);

        right: -100px;

        top: -100px;
      }

      .why-number {
        font-family: "Space Grotesk", sans-serif;

        font-size: 180px;

        line-height: 0.8;

        color: var(--mint);

        letter-spacing: -14px;

        position: absolute;

        left: 28px;

        top: 50px;
      }

      .why-card {
        position: absolute;

        left: 35px;

        right: 35px;

        bottom: 35px;

        padding: 20px;

        border: 1px solid rgba(255, 255, 255, 0.1);

        border-radius: 16px;

        background: rgba(255, 255, 255, 0.06);

        backdrop-filter: blur(8px);
      }

      .why-card-label {
        color: var(--mint);

        font-size: 9px;

        font-weight: 800;

        letter-spacing: 1.2px;

        margin-bottom: 10px;
      }

      .why-card h3 {
        font-family: "Space Grotesk", sans-serif;

        font-size: 25px;

        color: white;

        letter-spacing: -0.8px;

        margin-bottom: 8px;
      }

      .why-card p {
        color: rgba(255, 255, 255, 0.5);

        font-size: 11px;

        line-height: 1.7;
      }

      .benefits {
        display: flex;

        flex-direction: column;

        gap: 25px;

        margin-top: 30px;
      }

      .benefit {
        display: flex;

        gap: 15px;

        align-items: flex-start;
      }

      .benefit-icon {
        flex: 0 0 43px;

        width: 43px;

        height: 43px;

        display: flex;

        align-items: center;

        justify-content: center;

        border-radius: 12px;

        background: var(--mint);

        color: var(--ink);

        font-size: 14px;
      }

      .benefit h3 {
        font-family: "Space Grotesk", sans-serif;

        font-size: 16px;

        margin-bottom: 5px;
      }

      .benefit p {
        color: var(--muted);

        font-size: 11px;

        line-height: 1.65;
      }

      /* =====================================================
           PROCESS
           ===================================================== */

      .process-section {
        background: var(--paper-dark);

        border-top: 1px solid var(--line);

        border-bottom: 1px solid var(--line);
      }

      .process-grid {
        display: grid;

        grid-template-columns: repeat(4, 1fr);

        gap: 0;
      }

      .process-step {
        position: relative;

        padding: 25px 28px;

        border-right: 1px solid var(--line);
      }

      .process-step:first-child {
        padding-left: 0;
      }

      .process-step:last-child {
        border-right: none;
      }

      .process-number {
        width: 38px;

        height: 38px;

        display: flex;

        align-items: center;

        justify-content: center;

        border: 1px solid var(--line-dark);

        border-radius: 50%;

        font-family: "Space Grotesk", sans-serif;

        font-size: 12px;

        font-weight: 700;

        margin-bottom: 23px;
      }

      .process-step:nth-child(2) .process-number {
        background: var(--mint);

        border-color: var(--mint);
      }

      .process-step h3 {
        font-family: "Space Grotesk", sans-serif;

        font-size: 18px;

        margin-bottom: 8px;
      }

      .process-step p {
        color: var(--muted);

        font-size: 11px;

        line-height: 1.7;

        max-width: 220px;
      }

      /* =====================================================
           CANDIDATE / RECRUITER
           ===================================================== */

      .audience-section {
        background: var(--white);
      }

      .audience-grid {
        display: grid;

        grid-template-columns: 1fr 1fr;

        gap: 16px;
      }

      .audience-card {
        min-height: 340px;

        padding: 38px;

        border-radius: 24px;

        position: relative;

        overflow: hidden;

        display: flex;

        flex-direction: column;

        justify-content: space-between;
      }

      .candidate-card {
        background: var(--mint);
      }

      .recruiter-card {
        background: var(--ink);

        color: white;
      }

      .audience-card::before {
        content: "";

        position: absolute;

        width: 230px;

        height: 230px;

        border-radius: 50%;

        border: 1px solid rgba(19, 33, 30, 0.08);

        right: -80px;

        top: -80px;
      }

      .recruiter-card::before {
        border-color: rgba(255, 255, 255, 0.08);
      }

      .audience-icon {
        width: 52px;

        height: 52px;

        display: flex;

        align-items: center;

        justify-content: center;

        border-radius: 14px;

        background: rgba(255, 255, 255, 0.55);

        color: var(--ink);

        font-size: 18px;
      }

      .recruiter-card .audience-icon {
        background: rgba(255, 255, 255, 0.08);

        color: var(--mint);
      }

      .audience-card h3 {
        max-width: 450px;

        font-family: "Space Grotesk", sans-serif;

        font-size: clamp(29px, 3.3vw, 44px);

        line-height: 1;

        letter-spacing: -2px;

        margin-bottom: 13px;
      }

      .audience-card p {
        max-width: 470px;

        color: rgba(19, 33, 30, 0.65);

        font-size: 12px;

        line-height: 1.75;
      }

      .recruiter-card p {
        color: rgba(255, 255, 255, 0.55);
      }

      .audience-btn {
        align-self: flex-start;

        display: inline-flex;

        align-items: center;

        gap: 8px;

        padding: 12px 16px;

        border-radius: 9px;

        text-decoration: none;

        background: var(--ink);

        color: white;

        font-size: 11px;

        font-weight: 700;
      }

      .recruiter-card .audience-btn {
        background: var(--mint);

        color: var(--ink);
      }

      /* =====================================================
           TESTIMONIALS
           ===================================================== */

      .testimonials-section {
        background: var(--paper);
      }

      .testimonial-grid {
        display: grid;

        grid-template-columns: repeat(3, 1fr);

        gap: 16px;
      }

      .testimonial {
        padding: 28px;

        background: var(--white);

        border: 1px solid var(--line);

        border-radius: 18px;

        transition:
          transform 0.25s ease,
          box-shadow 0.25s ease;
      }

      .testimonial:hover {
        transform: translateY(-5px);

        box-shadow: var(--shadow-sm);
      }

      .quote-icon {
        color: var(--coral);

        font-size: 22px;

        margin-bottom: 22px;
      }

      .testimonial p {
        color: #4f5d57;

        font-size: 13px;

        line-height: 1.8;

        margin-bottom: 25px;
      }

      .person {
        display: flex;

        align-items: center;

        gap: 11px;

        padding-top: 15px;

        border-top: 1px solid var(--line);
      }

      .avatar {
        width: 37px;

        height: 37px;

        display: flex;

        align-items: center;

        justify-content: center;

        background: var(--mint);

        border-radius: 50%;

        font-family: "Space Grotesk", sans-serif;

        font-size: 12px;

        font-weight: 700;
      }

      .person strong {
        display: block;

        font-size: 11px;

        margin-bottom: 2px;
      }

      .person span {
        color: var(--muted);

        font-size: 9px;
      }

      /* =====================================================
           CTA
           ===================================================== */

      .cta-section {
        padding: 90px 0;

        background: var(--coral);

        overflow: hidden;
      }

      .cta-section::before {
        content: "SMARTHIRE";

        position: absolute;

        right: -30px;

        bottom: -45px;

        font-family: "Space Grotesk", sans-serif;

        font-size: 130px;

        font-weight: 700;

        letter-spacing: -7px;

        color: rgba(19, 33, 30, 0.07);

        pointer-events: none;
      }

      .cta-inner {
        position: relative;

        z-index: 2;

        display: flex;

        align-items: center;

        justify-content: space-between;

        gap: 30px;
      }

      .cta-label {
        font-size: 9px;

        font-weight: 800;

        letter-spacing: 1.5px;

        margin-bottom: 10px;

        color: rgba(19, 33, 30, 0.55);
      }

      .cta-inner h2 {
        max-width: 650px;

        font-family: "Space Grotesk", sans-serif;

        font-size: clamp(35px, 4.5vw, 58px);

        line-height: 1;

        letter-spacing: -3px;
      }

      .cta-btn {
        flex: 0 0 auto;

        display: inline-flex;

        align-items: center;

        gap: 10px;

        padding: 16px 20px;

        border-radius: 11px;

        background: var(--ink);

        color: white;

        text-decoration: none;

        font-size: 12px;

        font-weight: 700;

        box-shadow: 0 12px 25px rgba(19, 33, 30, 0.14);

        transition:
          transform 0.2s ease,
          box-shadow 0.2s ease;
      }

      .cta-btn i {
        color: var(--mint);

        transition: transform 0.2s ease;
      }

      .cta-btn:hover {
        transform: translateY(-3px);

        box-shadow: 0 17px 32px rgba(19, 33, 30, 0.2);
      }

      .cta-btn:hover i {
        transform: translateX(4px);
      }

      /* =====================================================
           FOOTER
           ===================================================== */

      .footer {
        background: var(--ink);

        color: white;
      }

      .footer-main {
        padding: 75px 0 60px;

        display: grid;

        grid-template-columns: 1.6fr 1fr 1fr 1fr;

        gap: 50px;
      }

      .footer .logo {
        color: white;

        margin-bottom: 17px;
      }

      .footer-brand p {
        max-width: 330px;

        color: rgba(255, 255, 255, 0.45);

        font-size: 11px;

        line-height: 1.8;
      }

      .footer-column {
        display: flex;

        flex-direction: column;

        gap: 10px;
      }

      .footer-column h4 {
        color: var(--mint);

        font-size: 10px;

        font-weight: 800;

        letter-spacing: 1px;

        text-transform: uppercase;

        margin-bottom: 7px;
      }

      .footer-column a {
        width: fit-content;

        text-decoration: none;

        color: rgba(255, 255, 255, 0.5);

        font-size: 11px;

        transition:
          color 0.2s ease,
          transform 0.2s ease;
      }

      .footer-column a:hover {
        color: white;

        transform: translateX(3px);
      }

      .footer-bottom {
        border-top: 1px solid rgba(255, 255, 255, 0.09);
      }

      .footer-bottom-inner {
        min-height: 65px;

        display: flex;

        align-items: center;

        justify-content: space-between;

        gap: 20px;
      }

      .footer-bottom p {
        color: rgba(255, 255, 255, 0.32);

        font-size: 9px;
      }

      .footer-status {
        display: flex;

        align-items: center;

        gap: 7px;

        color: rgba(255, 255, 255, 0.4);

        font-size: 9px;
      }

      .footer-status-dot {
        width: 6px;

        height: 6px;

        border-radius: 50%;

        background: #75bb61;
      }

      /* =====================================================
           ANIMATIONS
           ===================================================== */

      @keyframes heroEnter {
        from {
          opacity: 0;
          transform: translateY(22px);
        }

        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      @keyframes visualEnter {
        from {
          opacity: 0;
          transform: translateY(25px) rotate(7deg);
        }

        to {
          opacity: 1;
          transform: translateY(0) rotate(3deg);
        }
      }

      @keyframes floatA {
        0%,
        100% {
          transform: translateY(0);
        }

        50% {
          transform: translateY(-9px);
        }
      }

      @keyframes floatB {
        0%,
        100% {
          transform: translateY(0);
        }

        50% {
          transform: translateY(10px);
        }
      }

      /* =====================================================
           RESPONSIVE — TABLET
           ===================================================== */

      @media (max-width: 1000px) {
        .hero-inner {
          grid-template-columns: 1fr;

          gap: 60px;
        }

        .hero {
          min-height: auto;
        }

        .hero-content {
          max-width: 800px;
        }

        .hero-visual {
          min-height: 420px;

          max-width: 500px;

          width: 100%;

          margin: 0 auto;
        }

        .visual-card {
          right: 35px;
        }

        .jobs-grid {
          grid-template-columns: repeat(2, 1fr);
        }

        .categories-grid {
          grid-template-columns: repeat(2, 1fr);
        }

        .why-grid {
          grid-template-columns: 1fr;
        }

        .why-visual {
          max-width: 650px;

          width: 100%;

          margin: 0 auto;
        }

        .process-grid {
          grid-template-columns: repeat(2, 1fr);

          gap: 20px;
        }

        .process-step {
          border: none;

          padding: 20px;

          border: 1px solid var(--line);

          border-radius: 14px;
        }

        .process-step:first-child {
          padding-left: 20px;
        }

        .testimonial-grid {
          grid-template-columns: 1fr 1fr;
        }

        .testimonial:last-child {
          grid-column: span 2;
        }

        .footer-main {
          grid-template-columns: 1.5fr 1fr 1fr;
        }

        .footer-brand {
          grid-column: span 3;
        }
      }

      /* =====================================================
           RESPONSIVE — MOBILE
           ===================================================== */

      @media (max-width: 700px) {
        .container {
          width: min(calc(100% - 32px), var(--container));
        }

        .announcement {
          font-size: 9px;
        }

        .navbar {
          height: 68px;
        }

        .nav-links {
          display: none;
        }

        .logo {
          font-size: 21px;
        }

        .logo-icon {
          width: 34px;

          height: 34px;
        }

        .hero-inner {
          padding: 62px 0 70px;
        }

        .hero h1 {
          font-size: clamp(48px, 15vw, 67px);

          letter-spacing: -3.5px;
        }

        .hero-description {
          font-size: 14px;
        }

        .search-shell {
          padding: 7px;

          border-radius: 15px;
        }

        .search-filters {
          grid-template-columns: 1fr 1fr;
        }

        .search-meta {
          flex-wrap: wrap;

          gap: 9px;
        }

        .hero-visual {
          min-height: 390px;
        }

        .visual-card {
          right: 0;

          width: calc(100% - 35px);

          padding: 23px;

          border-radius: 23px;
        }

        .visual-top {
          margin-bottom: 50px;
        }

        .visual-card h3 {
          font-size: 27px;
        }

        .float-card-one {
          left: 0;
        }

        .float-card-two {
          right: 0;

          bottom: 55px;
        }

        .trust-inner {
          padding: 22px 0;

          flex-direction: column;

          align-items: flex-start;

          gap: 15px;
        }

        .trust-companies {
          justify-content: flex-start;

          gap: 18px 25px;
        }

        .trust-company {
          font-size: 13px;
        }

        .section-padding {
          padding: 75px 0;
        }

        .section-heading {
          flex-direction: column;

          align-items: flex-start;

          margin-bottom: 30px;
        }

        .section-heading h2 {
          letter-spacing: -2px;
        }

        .stats-grid {
          grid-template-columns: 1fr 1fr;
        }

        .stat {
          min-height: 85px;

          padding: 12px 15px;

          border-right: none;
        }

        .stat:nth-child(odd) {
          border-right: 1px solid rgba(255, 255, 255, 0.1);
        }

        .stat:nth-child(-n + 2) {
          border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .stat:first-child {
          padding-left: 0;
        }

        .stat strong {
          font-size: 29px;
        }

        .jobs-grid {
          grid-template-columns: 1fr;
        }

        .categories-grid {
          grid-template-columns: 1fr 1fr;

          gap: 9px;
        }

        .category-card {
          min-height: 125px;

          padding: 16px;
        }

        .category-card h3 {
          font-size: 14px;
        }

        .why-visual {
          min-height: 390px;
        }

        .why-number {
          font-size: 130px;
        }

        .process-grid {
          grid-template-columns: 1fr;
        }

        .audience-grid {
          grid-template-columns: 1fr;
        }

        .audience-card {
          min-height: 310px;

          padding: 28px;
        }

        .testimonial-grid {
          grid-template-columns: 1fr;
        }

        .testimonial:last-child {
          grid-column: auto;
        }

        .cta-section {
          padding: 65px 0;
        }

        .cta-inner {
          flex-direction: column;

          align-items: flex-start;
        }

        .cta-inner h2 {
          letter-spacing: -2px;
        }

        .footer-main {
          grid-template-columns: 1fr 1fr;

          gap: 35px;
        }

        .footer-brand {
          grid-column: span 2;
        }

        .footer-bottom-inner {
          min-height: 80px;

          flex-direction: column;

          justify-content: center;

          text-align: center;
        }
      }

      /* =====================================================
           SMALL MOBILE
           ===================================================== */

      @media (max-width: 420px) {
        .search-filters {
          grid-template-columns: 1fr;
        }

        .hero h1 {
          font-size: 47px;
        }

        .categories-grid {
          grid-template-columns: 1fr;
        }

        .float-card {
          padding: 10px 12px;
        }

        .float-text strong {
          font-size: 10px;
        }
      }

      /* =====================================================
           REDUCED MOTION
           ===================================================== */

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
    <!-- =========================================================
     ANNOUNCEMENT
     ========================================================= -->

    <div class="announcement">
      <div class="announcement-inner">
        <span class="announcement-dot"></span>

        <span>
          New opportunities are added regularly.
          <strong>Start your search today.</strong>
        </span>
      </div>
    </div>

    <!-- =========================================================
     NAVBAR
     ========================================================= -->

    <header class="navbar">
      <div class="container navbar-inner">
        <a href="/home.jsp" class="logo">
          <span class="logo-icon">
            <i class="fa-solid fa-briefcase"></i>
          </span>

          <span>SMARTHIRE</span>
        </a>

        <nav class="nav-links">
          <a href="/home.jsp" class="active"> Home </a>

          <a href="login.jsp"> Jobs </a>

          <a href="login.jsp"> Recruiters </a>

          <a href="login.jsp"> Login </a>

          <a href="register.jsp" class="register-btn"> Register </a>
        </nav>
      </div>
    </header>

    <!-- =========================================================
     HERO
     ========================================================= -->

    <main>
      <section class="hero">
        <div class="hero-decoration">OPPORTUNITY</div>

        <div class="container hero-inner">
          <!-- =================================================
             HERO CONTENT
             ================================================= -->

          <div class="hero-content">
            <div class="hero-tag">
              <span></span>

              India's Trusted Job Portal
            </div>

            <h1>
              Find Work That

              <span> Moves You Forward. </span>
            </h1>

            <p class="hero-description">
              Discover meaningful opportunities from growing startups,
              established enterprises and ambitious teams. Search smarter, apply
              faster and take the next step in your career.
            </p>

            <!-- =================================================
                 SEARCH
                 ================================================= -->

            <div class="search-shell">
              <form action="viewjob" method="get" class="hero-search">
                <!-- KEYWORD -->

                <div class="search-keyword">
                  <i class="fa-solid fa-magnifying-glass"></i>

                  <input
                    type="text"
                    name="search"
                    data-smart-search="role"
                    placeholder="Job title, keywords, or company"
                    autocomplete="off"
                  />
                </div>

                <!-- FILTERS -->

                <div class="search-filters">
                  <!-- COMPANY -->

                  <div class="search-select custom-select">
                    <input
                      type="text"
                      name="company"
                      class="custom-select-input"
                      placeholder="All Companies"
                      autocomplete="off"
                    />

                    <i class="fa-solid fa-chevron-down select-arrow"></i>

                    <div class="custom-dropdown">
                      <div class="custom-search-box">
                        <i class="fa-solid fa-magnifying-glass"></i>

                        <input
                          type="text"
                          class="dropdown-search"
                          placeholder="Search company..."
                          autocomplete="off"
                        />
                      </div>

                      <div class="dropdown-options">
                        <div class="dropdown-option" data-value="">
                          All Companies
                        </div>

                        <div class="dropdown-option" data-value="TCS">TCS</div>

                        <div class="dropdown-option" data-value="Infosys">
                          Infosys
                        </div>

                        <div class="dropdown-option" data-value="Wipro">
                          Wipro
                        </div>

                        <div class="dropdown-option" data-value="Accenture">
                          Accenture
                        </div>

                        <div class="dropdown-option" data-value="Microsoft">
                          Microsoft
                        </div>

                        <div class="dropdown-option" data-value="Amazon">
                          Amazon
                        </div>

                        <div class="dropdown-option" data-value="Google">
                          Google
                        </div>

                        <div class="dropdown-option" data-value="Zoho">
                          Zoho
                        </div>
                      </div>

                      <div class="custom-value-option">
                        <i class="fa-solid fa-plus"></i>

                        <span> Use custom value </span>
                      </div>
                    </div>
                  </div>

                  <!-- LOCATION -->

                  <div class="search-select custom-select">
                    <input
                      type="text"
                      name="location"
                      class="custom-select-input"
                      placeholder="All Locations"
                      autocomplete="off"
                    />

                    <i class="fa-solid fa-chevron-down select-arrow"></i>

                    <div class="custom-dropdown">
                      <div class="custom-search-box">
                        <i class="fa-solid fa-magnifying-glass"></i>

                        <input
                          type="text"
                          class="dropdown-search"
                          placeholder="Search location..."
                          autocomplete="off"
                        />
                      </div>

                      <div class="dropdown-options">
                        <div class="dropdown-option" data-value="">
                          All Locations
                        </div>

                        <div class="dropdown-option" data-value="Pune">
                          Pune
                        </div>

                        <div class="dropdown-option" data-value="Mumbai">
                          Mumbai
                        </div>

                        <div class="dropdown-option" data-value="Bengaluru">
                          Bengaluru
                        </div>

                        <div class="dropdown-option" data-value="Hyderabad">
                          Hyderabad
                        </div>

                        <div class="dropdown-option" data-value="Chennai">
                          Chennai
                        </div>

                        <div class="dropdown-option" data-value="Delhi NCR">
                          Delhi NCR
                        </div>

                        <div class="dropdown-option" data-value="Remote">
                          Remote
                        </div>
                      </div>

                      <div class="custom-value-option">
                        <i class="fa-solid fa-plus"></i>

                        <span> Use custom value </span>
                      </div>
                    </div>
                  </div>

                  <!-- EXPERIENCE -->

                  <div class="search-select">
                    <select name="experience">
                      <option value="">All Experiences</option>

                      <option value="Fresher">Fresher</option>

                      <option value="1-3 years">1-3 years</option>

                      <option value="3-5 years">3-5 years</option>

                      <option value="5+ years">5+ years</option>
                    </select>

                    <i class="fa-solid fa-chevron-down select-arrow"></i>
                  </div>

                  <!-- DATE -->

                  <div class="search-select">
                    <select name="posted">
                      <option value="">Date Posted (Newest)</option>

                      <option value="today">Today</option>

                      <option value="3">Last 3 days</option>

                      <option value="7">Last 7 days</option>

                      <option value="30">Last 30 days</option>
                    </select>

                    <i class="fa-solid fa-chevron-down select-arrow"></i>
                  </div>
                </div>

                <!-- SEARCH BUTTON -->

                <button type="submit" class="search-btn">
                  <span> Search Jobs </span>

                  <i class="fa-solid fa-arrow-right"></i>
                </button>
              </form>
            </div>

            <div class="search-meta">
              <span>
                <i class="fa-solid fa-circle-check"></i>

                Free for candidates
              </span>

              <span>
                <i class="fa-solid fa-shield-halved"></i>

                Trusted opportunities
              </span>

              <span>
                <i class="fa-solid fa-bolt"></i>

                Fast applications
              </span>
            </div>
          </div>

          <!-- =================================================
             HERO VISUAL
             ================================================= -->

          <div class="hero-visual">
            <div class="float-card float-card-one">
              <div class="float-icon">
                <i class="fa-solid fa-arrow-trend-up"></i>
              </div>

              <div class="float-text">
                <strong> Career growth </strong>

                <span> Starts with one opportunity </span>
              </div>
            </div>

            <div class="visual-card">
              <div class="visual-top">
                <span class="featured-badge"> FEATURED OPPORTUNITY </span>

                <span class="visual-menu">
                  <i class="fa-solid fa-ellipsis"></i>
                </span>
              </div>

              <div class="visual-icon">
                <i class="fa-brands fa-java"></i>
              </div>

              <p class="visual-small">Latest job opening</p>

              <h3>Java Developer</h3>

              <div class="visual-info">
                <span>
                  <i class="fa-solid fa-building"></i>

                  TCS
                </span>

                <span>
                  <i class="fa-solid fa-location-dot"></i>

                  Pune
                </span>
              </div>

              <div class="visual-bottom">
                <strong> ₹12 LPA </strong>

                <span> Full Time </span>
              </div>
            </div>

            <div class="float-card float-card-two">
              <div class="float-icon">
                <i class="fa-solid fa-check"></i>
              </div>

              <div class="float-text">
                <strong> Easy to apply </strong>

                <span> Your next step is simple </span>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- =========================================================
     TRUSTED COMPANIES
     ========================================================= -->

      <section class="trust-strip">
        <div class="container trust-inner">
          <span class="trust-copy"> OPPORTUNITIES FROM LEADING TEAMS </span>

          <div class="trust-companies">
            <span class="trust-company"> TCS </span>

            <span class="trust-company"> Infosys </span>

            <span class="trust-company"> Wipro </span>

            <span class="trust-company"> Capgemini </span>

            <span class="trust-company"> Accenture </span>

            <span class="trust-company"> HCL </span>
          </div>
        </div>
      </section>

      <!-- =========================================================
     STATS
     ========================================================= -->

      <section class="stats-section">
        <div class="container stats-grid">
          <div class="stat">
            <strong> 500+ </strong>

            <span> Active Jobs </span>
          </div>

          <div class="stat">
            <strong> 50+ </strong>

            <span> Hiring Companies </span>
          </div>

          <div class="stat">
            <strong> 200+ </strong>

            <span> Recruiters </span>
          </div>

          <div class="stat">
            <strong> 10K+ </strong>

            <span> Candidates </span>
          </div>
        </div>
      </section>

      <!-- =========================================================
     FEATURED JOBS
     ========================================================= -->

      <section class="featured-section section-padding">
        <div class="container">
          <div class="section-heading">
            <div>
              <div class="section-label">EXPLORE OPPORTUNITIES</div>

              <h2>
                Roles worth<br />
                moving for.
              </h2>
            </div>

            <div>
              <p class="description-small">
                Explore selected opportunities from companies looking for
                talented people like you.
              </p>

              <br />

              <a href="/viewjob" class="section-link">
                View all jobs

                <i class="fa-solid fa-arrow-right"></i>
              </a>
            </div>
          </div>

          <div class="jobs-grid">
            <!-- JOB 1 -->

            <article class="job-card">
              <div class="job-card-top">
                <div class="job-icon">
                  <i class="fa-brands fa-java"></i>
                </div>

                <span class="job-type"> Full Time </span>
              </div>

              <h3>Java Developer</h3>

              <p class="job-company">
                <i class="fa-solid fa-building"></i>

                TCS
              </p>

              <div class="job-details">
                <span>
                  <i class="fa-solid fa-location-dot"></i>

                  Pune
                </span>

                <span>
                  <i class="fa-solid fa-indian-rupee-sign"></i>

                  ₹12 LPA
                </span>
              </div>

              <a href="login.jsp" class="job-apply">
                Apply Now

                <i class="fa-solid fa-arrow-right"></i>
              </a>
            </article>

            <!-- JOB 2 -->

            <article class="job-card">
              <div class="job-card-top">
                <div class="job-icon">
                  <i class="fa-brands fa-react"></i>
                </div>

                <span class="job-type"> Full Time </span>
              </div>

              <h3>React Developer</h3>

              <p class="job-company">
                <i class="fa-solid fa-building"></i>

                Infosys
              </p>

              <div class="job-details">
                <span>
                  <i class="fa-solid fa-location-dot"></i>

                  Mumbai
                </span>

                <span>
                  <i class="fa-solid fa-indian-rupee-sign"></i>

                  ₹10 LPA
                </span>
              </div>

              <a href="login.jsp" class="job-apply">
                Apply Now

                <i class="fa-solid fa-arrow-right"></i>
              </a>
            </article>

            <!-- JOB 3 -->

            <article class="job-card">
              <div class="job-card-top">
                <div class="job-icon">
                  <i class="fa-solid fa-code"></i>
                </div>

                <span class="job-type"> Full Time </span>
              </div>

              <h3>Full Stack Developer</h3>

              <p class="job-company">
                <i class="fa-solid fa-building"></i>

                Wipro
              </p>

              <div class="job-details">
                <span>
                  <i class="fa-solid fa-location-dot"></i>

                  Bengaluru
                </span>

                <span>
                  <i class="fa-solid fa-indian-rupee-sign"></i>

                  ₹18 LPA
                </span>
              </div>

              <a href="login.jsp" class="job-apply">
                Apply Now

                <i class="fa-solid fa-arrow-right"></i>
              </a>
            </article>
          </div>
        </div>
      </section>

      <!-- =========================================================
     JOB CATEGORIES
     ========================================================= -->

      <section class="categories-section section-padding">
        <div class="container">
          <div class="section-heading">
            <div>
              <div class="section-label">FIND YOUR DIRECTION</div>

              <h2>
                Explore by<br />
                expertise.
              </h2>
            </div>

            <p class="description-small">
              Whether you're starting out or taking your next big step, find
              roles aligned with what you do best.
            </p>
          </div>

          <div class="categories-grid">
            <a href="/viewjob" class="category-card">
              <div class="category-icon">
                <i class="fa-solid fa-code"></i>
              </div>

              <div>
                <h3>Software Development</h3>

                <span> 120+ opportunities </span>
              </div>
            </a>

            <a href="/viewjob" class="category-card">
              <div class="category-icon">
                <i class="fa-solid fa-laptop-code"></i>
              </div>

              <div>
                <h3>Full Stack Development</h3>

                <span> 85+ opportunities </span>
              </div>
            </a>

            <a href="/viewjob" class="category-card">
              <div class="category-icon">
                <i class="fa-solid fa-database"></i>
              </div>

              <div>
                <h3>Data & Analytics</h3>

                <span> 70+ opportunities </span>
              </div>
            </a>

            <a href="/viewjob" class="category-card">
              <div class="category-icon">
                <i class="fa-solid fa-mobile-screen-button"></i>
              </div>

              <div>
                <h3>Mobile Development</h3>

                <span> 45+ opportunities </span>
              </div>
            </a>

            <a href="/viewjob" class="category-card">
              <div class="category-icon">
                <i class="fa-solid fa-cloud"></i>
              </div>

              <div>
                <h3>Cloud & DevOps</h3>

                <span> 60+ opportunities </span>
              </div>
            </a>

            <a href="/viewjob" class="category-card">
              <div class="category-icon">
                <i class="fa-solid fa-shield-halved"></i>
              </div>

              <div>
                <h3>Cyber Security</h3>

                <span> 35+ opportunities </span>
              </div>
            </a>

            <a href="/viewjob" class="category-card">
              <div class="category-icon">
                <i class="fa-solid fa-chart-line"></i>
              </div>

              <div>
                <h3>Business & Management</h3>

                <span> 50+ opportunities </span>
              </div>
            </a>

            <a href="/viewjob" class="category-card">
              <div class="category-icon">
                <i class="fa-solid fa-pen-nib"></i>
              </div>

              <div>
                <h3>Design & Creative</h3>

                <span> 30+ opportunities </span>
              </div>
            </a>
          </div>
        </div>
      </section>

      <!-- =========================================================
     WHY SMARTHIRE
     ========================================================= -->

      <section class="why-section section-padding">
        <div class="container why-grid">
          <div class="why-visual">
            <div class="why-number">01</div>

            <div class="why-card">
              <div class="why-card-label">THE SMARTER WAY TO SEARCH</div>

              <h3>
                Less noise.<br />
                Better opportunities.
              </h3>

              <p>
                SMARTHIRE is built to make job discovery simpler — so candidates
                can spend less time searching and more time preparing for what
                comes next.
              </p>
            </div>
          </div>

          <div>
            <div class="section-label">WHY SMARTHIRE</div>

            <h2
              style="
                font-family: &quot;Space Grotesk&quot;, sans-serif;
                font-size: clamp(36px, 4vw, 55px);
                line-height: 1;
                letter-spacing: -2.8px;
              "
            >
              Everything you need to move your career forward.
            </h2>

            <div class="benefits">
              <div class="benefit">
                <div class="benefit-icon">
                  <i class="fa-solid fa-bolt"></i>
                </div>

                <div>
                  <h3>Fast & simple applications</h3>

                  <p>
                    Find relevant roles and move from discovery to application
                    without unnecessary friction.
                  </p>
                </div>
              </div>

              <div class="benefit">
                <div class="benefit-icon">
                  <i class="fa-solid fa-shield-halved"></i>
                </div>

                <div>
                  <h3>A secure experience</h3>

                  <p>
                    Your profile and application journey are designed with
                    privacy and security in mind.
                  </p>
                </div>
              </div>

              <div class="benefit">
                <div class="benefit-icon">
                  <i class="fa-solid fa-building-circle-check"></i>
                </div>

                <div>
                  <h3>Trusted opportunities</h3>

                  <p>
                    Discover opportunities from companies actively looking for
                    their next great hire.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- =========================================================
     HOW IT WORKS
     ========================================================= -->

      <section class="process-section section-padding">
        <div class="container">
          <div class="section-heading">
            <div>
              <div class="section-label">HOW IT WORKS</div>

              <h2>
                From search<br />
                to success.
              </h2>
            </div>

            <p class="description-small">
              A straightforward journey designed to keep your focus where it
              belongs — on finding the right opportunity.
            </p>
          </div>

          <div class="process-grid">
            <div class="process-step">
              <div class="process-number">01</div>

              <h3>Create your profile</h3>

              <p>
                Build your candidate profile and showcase the skills that make
                you stand out.
              </p>
            </div>

            <div class="process-step">
              <div class="process-number">02</div>

              <h3>Discover opportunities</h3>

              <p>
                Search by role, company, location and experience to find
                relevant jobs.
              </p>
            </div>

            <div class="process-step">
              <div class="process-number">03</div>

              <h3>Apply with confidence</h3>

              <p>
                Review the opportunity and submit your application in just a few
                simple steps.
              </p>
            </div>

            <div class="process-step">
              <div class="process-number">04</div>

              <h3>Grow your career</h3>

              <p>
                Track your applications and move closer to the opportunity
                you've been looking for.
              </p>
            </div>
          </div>
        </div>
      </section>

      <!-- =========================================================
     CANDIDATE / RECRUITER
     ========================================================= -->

      <section class="audience-section section-padding">
        <div class="container">
          <div class="section-heading">
            <div>
              <div class="section-label">BUILT FOR BOTH SIDES</div>

              <h2>
                One platform.<br />
                Two ambitions.
              </h2>
            </div>
          </div>

          <div class="audience-grid">
            <!-- CANDIDATE -->

            <div class="audience-card candidate-card">
              <div class="audience-icon">
                <i class="fa-solid fa-user"></i>
              </div>

              <div>
                <h3>Looking for your next opportunity?</h3>

                <p>
                  Build your profile, discover jobs that match your ambitions
                  and take your next career step with confidence.
                </p>
              </div>

              <a href="register.jsp" class="audience-btn">
                Create Candidate Account

                <i class="fa-solid fa-arrow-right"></i>
              </a>
            </div>

            <!-- RECRUITER -->

            <div class="audience-card recruiter-card">
              <div class="audience-icon">
                <i class="fa-solid fa-building"></i>
              </div>

              <div>
                <h3>Looking for your next great hire?</h3>

                <p>
                  Reach talented candidates, publish opportunities and build
                  your next high-performing team.
                </p>
              </div>

              <a href="register.jsp" class="audience-btn">
                Join as Recruiter

                <i class="fa-solid fa-arrow-right"></i>
              </a>
            </div>
          </div>
        </div>
      </section>

      <!-- =========================================================
     TESTIMONIALS
     ========================================================= -->

      <section class="testimonials-section section-padding">
        <div class="container">
          <div class="section-heading">
            <div>
              <div class="section-label">CANDIDATE STORIES</div>

              <h2>
                Good careers<br />
                start somewhere.
              </h2>
            </div>

            <p class="description-small">
              A better job search isn't just about finding another role. It's
              about finding the right next step.
            </p>
          </div>

          <div class="testimonial-grid">
            <article class="testimonial">
              <div class="quote-icon">
                <i class="fa-solid fa-quote-left"></i>
              </div>

              <p>
                “The search experience is simple and focused. I could quickly
                narrow down opportunities based on the role and location I
                wanted.”
              </p>

              <div class="person">
                <div class="avatar">AK</div>

                <div>
                  <strong> Aditi K. </strong>

                  <span> Software Developer </span>
                </div>
              </div>
            </article>

            <article class="testimonial">
              <div class="quote-icon">
                <i class="fa-solid fa-quote-left"></i>
              </div>

              <p>
                “What I liked most was being able to compare different
                opportunities before deciding where I wanted to apply.”
              </p>

              <div class="person">
                <div class="avatar">RS</div>

                <div>
                  <strong> Rahul S. </strong>

                  <span> Full Stack Developer </span>
                </div>
              </div>
            </article>

            <article class="testimonial">
              <div class="quote-icon">
                <i class="fa-solid fa-quote-left"></i>
              </div>

              <p>
                “Hiring becomes much easier when the platform keeps the
                experience straightforward for both recruiters and candidates.”
              </p>

              <div class="person">
                <div class="avatar">PM</div>

                <div>
                  <strong> Priya M. </strong>

                  <span> Talent Acquisition </span>
                </div>
              </div>
            </article>
          </div>
        </div>
      </section>

      <!-- =========================================================
     FINAL CTA
     ========================================================= -->

      <section class="cta-section">
        <div class="container cta-inner">
          <div>
            <p class="cta-label">YOUR NEXT OPPORTUNITY IS WAITING</p>

            <h2>Ready to make your next move?</h2>
          </div>

          <a href="register.jsp" class="cta-btn">
            Create Free Account

            <i class="fa-solid fa-arrow-right"></i>
          </a>
        </div>
      </section>
    </main>

    <!-- =========================================================
     FOOTER
     ========================================================= -->

    <footer class="footer">
      <div class="container footer-main">
        <!-- BRAND -->

        <div class="footer-brand">
          <a href="/home.jsp" class="logo">
            <span class="logo-icon">
              <i class="fa-solid fa-briefcase"></i>
            </span>

            <span> SMARTHIRE </span>
          </a>

          <p>
            Connecting talented people with meaningful opportunities and helping
            ambitious teams find the people they need to grow.
          </p>
        </div>

        <!-- PLATFORM -->

        <div class="footer-column">
          <h4>Platform</h4>

          <a href="/home.jsp"> Home </a>

          <a href="/viewjob"> Browse Jobs </a>

          <a href="login.jsp"> Recruiters </a>

          <a href="login.jsp"> Login </a>
        </div>

        <!-- CANDIDATES -->

        <div class="footer-column">
          <h4>Candidates</h4>

          <a href="register.jsp"> Create Profile </a>

          <a href="/viewjob"> Find Jobs </a>

          <a href="login.jsp"> Apply Jobs </a>

          <a href="login.jsp"> Track Applications </a>
        </div>

        <!-- COMPANY -->

        <div class="footer-column">
          <h4>Company</h4>

          <a href="/home.jsp"> About SMARTHIRE </a>

          <a href="register.jsp"> Hire Talent </a>

          <a href="/viewjob"> Opportunities </a>

          <a href="/home.jsp"> Contact </a>
        </div>
      </div>

      <!-- FOOTER BOTTOM -->

      <div class="footer-bottom">
        <div class="container footer-bottom-inner">
          <p>© 2026 SMARTHIRE. All Rights Reserved.</p>

          <div class="footer-status">
            <span class="footer-status-dot"></span>

            Platform is available
          </div>
        </div>
      </div>
    </footer>

    <!-- =========================================================
     SMART SEARCH
     ========================================================= -->

    <script src="js/smart-search.js"></script>
  </body>
</html>
