/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.everson.clei.springmvc.controller;

import br.com.tiago.amado.springmvc.model.Cliente;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Faculdade Alfa
 */
@Controller
public class ClienteController {

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
        c.setId(Math.round(Math.random()*10000));
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
        m.addAttribute(hs.getAttribute("clienteAtual"));
        return "clientes/PainelDoCliente";
    }

//    @RequestMapping("/persistePessoa")
////    public String persistePessoa(Model m, Pessoa p) {
//    public String persistePessoa(HttpSession hs, Pessoa p) {
//        //faz a persistencia
//        p.setId(Math.round(Math.random()*100));
////        m.addAttribute("pessoa", p);
//        hs.setAttribute("pessoa", p);
//
//        return "mensagens/mensagemCadastro";
//    }
    
    @RequestMapping("/informarValoresDeSaque")
    public String novoSaque() {
        return "saque/saldo";
    }

//    @RequestMapping("/buscarConta")
//    public String buscarConta(HttpSession hs, Model m) {
//        List<Conta> contasEncontradas = new ArrayList<>();
//        Pessoa p = (Pessoa) hs.getAttribute("pessoa");
//        
//        Conta contaAuxiliar = new Conta(Math.round(Math.random()*100), "3327", "10", p, "12340");
//        contas.add(contaAuxiliar);
//        
//        //buscar conta e seu saldo
//        contas.stream().filter((aux) -> (p.equals(aux.getCliente()))).forEach((aux) -> {
//            contasEncontradas.add(aux);
//        });
//        
//        m.addAttribute("contas", contasEncontradas);
//        
//        return "saque/novo";
//    }
//    
//    @RequestMapping("/realizarSaque")
//    public String realizarSaque(Model m, Pessoa p) {
//        //abrir a tela de saque
//
////        m.addAttribute("pessoa", p);
//
//        return "mensagens/mensagemCadastro";
//    }
}
