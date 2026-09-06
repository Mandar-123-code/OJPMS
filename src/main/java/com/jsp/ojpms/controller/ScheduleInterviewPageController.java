package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/scheduleinterviewpage")
public class ScheduleInterviewPageController extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        int userId =
                Integer.parseInt(
                req.getParameter("userId"));

        int jobId =
                Integer.parseInt(
                req.getParameter("jobId"));

        req.setAttribute("userId", userId);

        req.setAttribute("jobId", jobId);

        req.getRequestDispatcher(
                "schedule-interview.jsp")
                .forward(req, resp);
    }
}
