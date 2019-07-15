/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database.web;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author rodrigo
 */
@WebServlet(name = "processImage", urlPatterns = {"/processImage"})
@MultipartConfig(maxFileSize = 16177215)
public class processImage extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();  
        String cpf = (String) session.getAttribute("me.cpf");

        try {

            if (request.getParameter("gravar") != null) {
                String texto = request.getParameter("areaTexto");
                ExerCompletarFrase.inserirExercicio(texto, "dragDrop.jsp", cpf, "Completar Frase");
                ExerCompletarFrase exer = ExerCompletarFrase.ultimoCadastro(cpf);
                
                try {
                    String parametro1 = request.getParameter("palavra1");
                    Part filePart1 = request.getPart("ex1wo1");
                    System.out.println(parametro1);
                    if (parametro1 != null && filePart1 != null) {
//                        System.out.println(filePart1.getName());
//                        System.out.println(filePart1.getSize());
//                        System.out.println(filePart1.getContentType());
                        ParametroCompletarFrase.inserirParametro(1, exer.getCodigo(), parametro1, filePart1);
                    }
//                if(filePart != null){
////                    System.out.println(filePart.getName());
////                    System.out.println(filePart.getSize());
////                    System.out.println(filePart.getContentType());
////                    inputStream = filePart.getInputStream();
//                }

                } catch (Exception e) {
                }
                try {
                    String parametro2 = request.getParameter("palavra2");
                    Part filePart2 = request.getPart("ex1wo2");
                    System.out.println(filePart2);
                    System.out.println(parametro2);
                    if (parametro2 != null && filePart2 != null) {
                        ParametroCompletarFrase.inserirParametro(2, exer.getCodigo(), parametro2, filePart2);
                    }
                } catch (Exception e) {
                }
                try {
                    String parametro3 = request.getParameter("palavra3");
                    Part filePart3 = request.getPart("ex1wo3");
                    if (parametro3 != null && filePart3 != null) {
                        ParametroCompletarFrase.inserirParametro(3, exer.getCodigo(), parametro3, filePart3);
                    }
                } catch (Exception e) {
                }
                try {
                    String parametro4 = request.getParameter("palavra4");
                    Part filePart4 = request.getPart("ex1wo4");
                    if (parametro4 != null && filePart4 != null) {
                        ParametroCompletarFrase.inserirParametro(4, exer.getCodigo(), parametro4, filePart4);
                    }
                } catch (Exception e) {
                }
                try {
                    String parametro5 = request.getParameter("palavra5");
                    Part filePart5 = request.getPart("ex1wo5");
                    if (parametro5 != null && filePart5 != null) {
                        ParametroCompletarFrase.inserirParametro(5, exer.getCodigo(), parametro5, filePart5);
                    }
                } catch (Exception e) {
                }
                try {
                    String parametro6 = request.getParameter("palavra6");
                    Part filePart6 = request.getPart("ex1wo6");
                    if (parametro6 != null && filePart6 != null) {
                        ParametroCompletarFrase.inserirParametro(6, exer.getCodigo(), parametro6, filePart6);
                    }
                } catch (Exception e) {
                }
                try {
                    String parametro7 = request.getParameter("palavra7");
                    Part filePart7 = request.getPart("ex1wo7");
                    if (parametro7 != null && filePart7 != null) {
                        ParametroCompletarFrase.inserirParametro(7, exer.getCodigo(), parametro7, filePart7);
                    }
                } catch (Exception e) {
                }
                try {
                    String parametro8 = request.getParameter("palavra8");
                    Part filePart8 = request.getPart("ex1wo8");
                    if (parametro8 != null && filePart8 != null) {
                        ParametroCompletarFrase.inserirParametro(8, exer.getCodigo(), parametro8, filePart8);
                    }
                } catch (Exception e) {
                }
                try {
                    String parametro9 = request.getParameter("palavra9");
                    Part filePart9 = request.getPart("ex1wo9");
                    if (parametro9 != null && filePart9 != null) {
                        ParametroCompletarFrase.inserirParametro(9, exer.getCodigo(), parametro9, filePart9);
                    }
                } catch (Exception e) {
                }
                try {
                    String parametro10 = request.getParameter("palavra10");
                    Part filePart10 = request.getPart("ex1wo10");
                    if (parametro10 != null && filePart10 != null) {
                        ParametroCompletarFrase.inserirParametro(10, exer.getCodigo(), parametro10, filePart10);
                    }
                } catch (Exception e) {
                }

            }
        } catch (Exception e) {

        }

//        InputStream inputStream = null;
//
//        Part filePart = request.getPart("ex1wo1");
//
//        if (filePart != null) {
//            System.out.println(filePart.getName());
//            System.out.println(filePart.getSize());
//            System.out.println(filePart.getContentType());
//
//            inputStream = filePart.getInputStream();
//        }

        RequestDispatcher rs = request.getRequestDispatcher("dragDrop.jsp");
        rs.forward(request,response);
    }

}
