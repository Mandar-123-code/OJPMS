<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Schedule Interview | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/schedule-interview.css">
</head>
<body>

<div class="sidebar">
  <div class="sidebar-logo">
    <div class="sidebar-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div class="sidebar-logo-text"><h2>SMARTHIRE</h2><span>Recruiter Portal</span></div>
  </div>
  <nav class="sidebar-nav">
    <a href="recruiter-dashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="postedjobs"><i class="fa-solid fa-list-ul"></i> My Jobs</a>
    <a href="shortlistedcandidates" class="active"><i class="fa-solid fa-star"></i> Shortlisted</a>
    <a href="rejectedcandidates"><i class="fa-solid fa-circle-xmark"></i> Rejected</a>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>

<div class="main-content">
  <div class="topbar">
    <div class="topbar-left">
      <h1><i class="fa-solid fa-calendar-days" style="color:#0A66C2;margin-right:8px;"></i> Schedule Interview</h1>
    </div>
    <div class="topbar-right">
      <a href="shortlistedcandidates" class="btn btn-secondary btn-sm"><i class="fa-solid fa-arrow-left"></i> Back</a>
    </div>
  </div>

  <div class="si-info-card">
    <div class="si-info-title">Interview Details</div>
    <div class="si-id-pills">
      <div class="si-pill">
        <i class="fa-solid fa-user"></i>
        Candidate ID: <strong>${userId}</strong>
      </div>
      <div class="si-pill">
        <i class="fa-solid fa-briefcase"></i>
        Job ID: <strong>${jobId}</strong>
      </div>
    </div>
  </div>

  <div class="si-form-wrapper">
    <div class="si-form-card">
      <h3 class="si-form-title"><i class="fa-solid fa-calendar-plus"></i> Schedule & Send Mail</h3>

      <form action="scheduleinterview" method="post">

        <input type="hidden" name="userId" value="${userId}">
        <input type="hidden" name="jobId"  value="${jobId}">

        <div class="si-input-group">
          <label for="siDate"><i class="fa-solid fa-calendar"></i> Interview Date</label>
          <input type="date" id="siDate" name="date" required>
        </div>

        <div class="si-input-group">
          <label for="siTime"><i class="fa-solid fa-clock"></i> Interview Time</label>
          <input type="time" id="siTime" name="time" required>
        </div>

        <div class="si-input-group">
          <label for="siMode"><i class="fa-solid fa-video"></i> Interview Mode</label>
          <select id="siMode" name="mode">
            <option value="Online">Online</option>
            <option value="Offline">Offline</option>
          </select>
        </div>

        <button type="submit" class="schedule-btn">
          <i class="fa-solid fa-paper-plane"></i> Schedule &amp; Send Mail
        </button>

      </form>
    </div>
  </div>
</div>
</body>
</html>