/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database.web;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rodrigo
 */
@WebServlet(name = "getImage", urlPatterns = {"/getImage"})
public class getImage extends HttpServlet {
    byte[][] img = new byte[10][];
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //System.out.println(request.getSession().getAttribute("img"));
        int id = (int) request.getSession().getAttribute("id");
        byte[][] img = new byte[10][];
        img[id] =  (byte[]) request.getSession().getAttribute("img"+id);
//        byte[] img = (byte[]) request.getSession().getAttribute("img"+id);
        response.setContentType("image/png");
        response.setHeader("Content-Disposition", "inline");
        response.setContentLength(img.length);
        //System.out.println(img);
        System.out.println(img.length);
        try{
            OutputStream output = response.getOutputStream();
            output.write(img[id]);
            output.flush();
            output.close();
        }catch(Exception e){
            
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println(request.getSession().getAttribute("img"));
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
//        byte[][] img = new byte[10][];
        img[id] =  (byte[]) request.getSession().getAttribute("img"+id);
        System.out.println(img[id]);
//        byte[] img = (byte[]) request.getSession().getAttribute("img"+id);
        response.setContentType("image/png");
        response.setHeader("Content-Disposition", "inline");
        response.setContentLength(img[id].length);
        //System.out.println(img);
        System.out.println(img[id].length);
        try{
            OutputStream output = response.getOutputStream();
            output.write(img[id]);
            output.flush();
            output.close();
        }catch(Exception e){
            
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println(request.getSession().getAttribute("img"));
        byte[] img = (byte[]) request.getSession().getAttribute("img");
        response.setContentType("image/png");
        response.setHeader("Content-Disposition", "inline");
        response.setContentLength(img.length);
        System.out.println(img);
        System.out.println(img.length);
        OutputStream output = response.getOutputStream();
        output.write(img);
        output.flush();
        output.close();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
