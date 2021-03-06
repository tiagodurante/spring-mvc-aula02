/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.everson.clei.springmvc.controller;

import br.com.tiago.amado.springmvc.dao.DAO;
import static br.com.tiago.amado.springmvc.dao.DAO.getSession;
import br.com.tiago.amado.springmvc.model.Cliente;
import br.com.tiago.amado.springmvc.model.Conta;
import br.com.tiago.amado.springmvc.model.Operacao;
import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Faculdade Alfa
 */
@Controller
public class ContasController extends DAO{

    private List<Conta> contas;
    private List<Operacao> operacoes;

    public ContasController() {
        contas = new ArrayList<>();
        operacoes = new ArrayList<>();
    }

    @RequestMapping("/painesDeContas")
    public String index(HttpSession hs, Model m) {
        Cliente cliente = (Cliente) hs.getAttribute("clienteAtual");

        List<Conta> contasEncontradas = new ArrayList<>();

        contas.stream().filter((aux) -> (aux.getCliente().getId().equals(cliente.getId()))).forEach((aux) -> {;
            contasEncontradas.add(aux);
        });

        m.addAttribute("cliente", cliente);
        m.addAttribute("contasEncontradas", contasEncontradas);
        return "contas/PainelDeContas";
    }

    @RequestMapping("/PainelDoClienteComOperacoes")
    public String painelComOperacoesDoCliente(HttpSession hs, Model m) {
        Cliente cliente = (Cliente) hs.getAttribute("clienteAtual");

        List<Operacao> operacoesEncontradas = new ArrayList<>();
        operacoes.stream().filter((op) -> (op.getConta().getCliente().getId().equals(cliente.getId()))).forEach((op) -> {
            operacoesEncontradas.add(op);
        });

        Collections.reverse(operacoesEncontradas);
        m.addAttribute("cliente", cliente);
        m.addAttribute("operacoesEncontradas", operacoesEncontradas);
        return "clientes/PainelDoCliente";
    }

    @RequestMapping("novaConta")
    public String novaConta(HttpServletResponse hsr, HttpSession hs, Model m) {
        Cliente cliente = (Cliente) hs.getAttribute("clienteAtual");
        m.addAttribute("cliente", cliente);
        return "contas/NovaConta";
    }

    @RequestMapping("salvarConta")
    public String salvar(HttpServletResponse hsr, HttpSession hs, Model m, Conta c) {
        Cliente cliente = (Cliente) hs.getAttribute("clienteAtual");
        m.addAttribute("cliente", cliente);
        c.setId(Math.round(Math.random() * 10000));
        c.setCliente(cliente);
        c.setSaldo("0");
        try {
            begin();
            getSession().save(c);
            commit();
        } catch (HibernateException e) {
            rollback();
            e.printStackTrace();
        }
        contas.add(c);
        return "redirect:painesDeContas";
    }

    @RequestMapping("selecionarConta")
    public String abrirConta(HttpServletRequest hsr, HttpSession hs, Model m, Conta c) {
        Cliente cliente = (Cliente) hs.getAttribute("clienteAtual");
        Conta conta = (Conta) contas.get(Integer.parseInt(hsr.getParameter("id")));
        hs.setAttribute("contaAtual", contas.get(Integer.parseInt(hsr.getParameter("id"))));

        List<Operacao> operacoesEncontradas = new ArrayList<>();
        operacoes.stream().filter((op) -> (op.getConta().equals(conta))).forEachOrdered((op) -> {
            operacoesEncontradas.add(op);
        });

        m.addAttribute("cliente", cliente);
        m.addAttribute("conta", conta);
        m.addAttribute("operacoesEncontradas", operacoesEncontradas);
        return "contas/DetalhesDaConta";
    }

    @RequestMapping("selecionarContaJaNaSession")
    public String abrirContaDaSession(HttpServletRequest hsr, HttpSession hs, Model m, Conta c) {
        Cliente cliente = (Cliente) hs.getAttribute("clienteAtual");
        Conta conta = (Conta) hs.getAttribute("contaAtual");

        List<Operacao> operacoesEncontradas = new ArrayList<>();
        operacoes.stream().filter((op) -> (op.getConta().equals(conta))).forEachOrdered((op) -> {
            operacoesEncontradas.add(op);
        });

        m.addAttribute("cliente", cliente);
        m.addAttribute("conta", conta);
        m.addAttribute("operacoesEncontradas", operacoesEncontradas);
        return "contas/DetalhesDaConta";
    }

    @RequestMapping("novoSaqueNaConta")
    public String novoSaque(HttpServletRequest hsr, HttpSession hs, Model m, Conta c) {
        Cliente cliente = (Cliente) hs.getAttribute("clienteAtual");
        Conta conta = (Conta) hs.getAttribute("contaAtual");
        m.addAttribute("cliente", cliente);
        m.addAttribute("conta", conta);
        return "contas/novoSaque";
    }

    @RequestMapping("novoDepositoNaConta")
    public String novoDeposito(HttpServletRequest hsr, HttpSession hs, Model m, Conta c) {
        Cliente cliente = (Cliente) hs.getAttribute("clienteAtual");
        Conta conta = (Conta) hs.getAttribute("contaAtual");
        m.addAttribute("cliente", cliente);
        m.addAttribute("conta", conta);
        return "contas/novoDeposito";
    }

    @RequestMapping("sacarDinheiroDaConta")
    public String sacar(HttpServletRequest hsr, HttpSession hs, Model m, Operacao o) {
        Cliente cliente = (Cliente) hs.getAttribute("clienteAtual");
        Conta conta = (Conta) hs.getAttribute("contaAtual");
        o.setId(Math.round(Math.random() * 10000));
        o.setConta(conta);
        o.setTipo("Saque");
        o.setIdentificador(cliente);
        o.setSaldoAnterior(conta.getSaldo());

        contas.stream().filter((aux) -> (aux.getId().equals(conta.getId()))).forEachOrdered((aux) -> {
            conta.setSaldo(String.valueOf(Integer.parseInt(aux.getSaldo()) - Integer.parseInt(o.getValor())));
            aux.setSaldo(conta.getSaldo());
        });
        o.setSaldoAtual(conta.getSaldo());
        try {
            begin();
            getSession().save(o);
            commit();
        } catch (HibernateException e) {
            rollback();
            e.printStackTrace();
        }
        operacoes.add(o);
        return "redirect:selecionarContaJaNaSession";
    }

    @RequestMapping("depositarDinheiroDaConta")
    public String depositar(HttpServletRequest hsr, HttpSession hs, Model m, Operacao o) {
        Cliente cliente = (Cliente) hs.getAttribute("clienteAtual");
        Conta conta = (Conta) hs.getAttribute("contaAtual");
        o.setId(Math.round(Math.random() * 10000));
        o.setConta(conta);
        o.setTipo("Depósito");
        o.setIdentificador(cliente);
        o.setSaldoAnterior(conta.getSaldo());

        contas.stream().filter((aux) -> (aux.getId().equals(conta.getId()))).forEachOrdered((aux) -> {
            conta.setSaldo(String.valueOf(Integer.parseInt(aux.getSaldo()) + Integer.parseInt(o.getValor())));
            aux.setSaldo(conta.getSaldo());
        });
        o.setSaldoAtual(conta.getSaldo());
        try {
            begin();
            getSession().save(o);
            commit();
        } catch (HibernateException e) {
            rollback();
            e.printStackTrace();
        }
        operacoes.add(o);
        return "redirect:selecionarContaJaNaSession";
    }

    @RequestMapping("sairDaConta")
    public String sair(HttpServletRequest hsr, HttpSession hs, Model m, Operacao o) {
        hs.invalidate();
        return "redirect:inicio";
    }

    @RequestMapping("depositoSemConta")
    public String novoDepositoSemConta(HttpServletRequest hsr, HttpSession hs, Model m, Operacao o) {
        m.addAttribute("contas", contas);
        return "contas/DepositoSemContaLogada";
    }

    @RequestMapping("/salvarDepositoSemContaLogada")
    public String depositarSemConta(HttpServletRequest hsr, HttpSession hs, Model m, Operacao o) {
        Conta conta = (Conta) contas.get(Integer.parseInt(hsr.getParameter("contaSelecionada")));

        for (Conta op : contas) {
            if (conta.getId().equals(op.getId())) {
                o.setSaldoAnterior(op.getSaldo());
                op.setSaldo(String.valueOf(Integer.parseInt(op.getSaldo()) + Integer.parseInt(o.getValor())));
                o.setSaldoAtual(op.getSaldo());
            }
        }

        o.setConta(conta);
        o.setIdentificador(new Cliente("Sem Identificação"));
        o.setId(Math.round(Math.random() * 10000));
        o.setTipo("Depósito não identificado");
        try {
            begin();
            getSession().save(o);
            commit();
        } catch (HibernateException e) {
            rollback();
            e.printStackTrace();
        }
        operacoes.add(o);
        return "mensagens/DepositoSemContaLogadaRealizado";
    }
}
