package com.BusanOn.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorPageController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {


        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        Object message = request.getAttribute(RequestDispatcher.ERROR_MESSAGE);
        Object uri = request.getAttribute(RequestDispatcher.ERROR_REQUEST_URI);

        int statusCode = 500;

        if (status != null) {
            try {
                statusCode = Integer.parseInt(status.toString());
            } catch (Exception e) {
                statusCode = 500;
            }
        }

        model.addAttribute("statusCode", statusCode);
        model.addAttribute("message", message);
        model.addAttribute("path", uri);

        return "BusanOn/error/error";
    }
}