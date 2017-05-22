/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.everson.clei.springmvc.controller;

import br.com.tiago.amado.springmvc.model.Cliente;
import br.com.tiago.amado.springmvc.model.Conta;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Faculdade Alfa
 */
@Controller
public class ContasController {
    private List<Conta> contas;

    public ContasController() {
        contas = new ArrayList<>();
    }

    @RequestMapping("/painesDeContas")
    public String index(HttpSession hs, Model m) {
        Cliente cliente = (Cliente) hs.getAttribute("clienteAtual");
        
        List<Conta> contasEncontradas = new ArrayList<>();
        
        contas.stream().filter((aux) -> (aux.getCliente().equals(cliente))).forEach((aux) -> {
            contasEncontradas.add(aux);
        });
        
        m.addAttribute("cliente", cliente);
        m.addAttribute("contasEncontradas", contasEncontradas);
        return "contas/PainelDeContas";
    }
}
