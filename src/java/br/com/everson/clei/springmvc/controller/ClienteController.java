/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.everson.clei.springmvc.controller;

import br.com.tiago.amado.springmvc.dao.DAO;
import br.com.tiago.amado.springmvc.model.Cliente;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Faculdade Alfa
 */
@Controller
public class ClienteController extends DAO {

    private List<Cliente> clientes;

    public ClienteController() {
        clientes = new ArrayList<>();
    }

    @RequestMapping("/inicio")
    public String index(Model m) {
        m.addAttribute("clientesCadastrados", clientes);
        return "clientes/ListaDeClientesView";
    }

    @RequestMapping("/novoCadastroDeCliente")
    public String cadastrarNovoCliente() {
        return "clientes/CadastroClienteView";
    }

    @RequestMapping("/salvarCadastroDeCliente")
    public String persistirNovoCliente(Model m, Cliente c) {
        c.setId(Math.round(Math.random() * 10000));
        try {
            begin();
            getSession().save(c);
            commit();
        } catch (HibernateException e) {
            rollback();
            e.printStackTrace();
        }
        clientes.add(c);
        return "redirect:inicio";
    }

    @RequestMapping("/excluirCliente")
    public String persistirNovoCliente(HttpServletRequest hsr, Cliente c) {
        clientes.remove(Integer.parseInt(hsr.getParameter("id")));
        System.err.println(clientes);
        return "redirect:inicio";
    }

    @RequestMapping("/selecionarCliente ")
    public String importarClienteNoSession(HttpServletRequest hsr, HttpSession hs, Cliente c, Model m) {
        hs.setAttribute("clienteAtual", clientes.get(Integer.parseInt(hsr.getParameter("id"))));
        return "redirect:painelDoCliente";
    }

    @RequestMapping("/painelDoCliente ")
    public String importarClienteNoSession(HttpSession hs, Cliente c, Model m) {
        return "redirect:PainelDoClienteComOperacoes";
    }
    
    @RequestMapping("/informarValoresDeSaque")
    public String novoSaque() {
        return "saque/saldo";
    }
}
