/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.tiago.amado.springmvc.model;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 *
 * @author tiago
 */
@Entity
public class Operacao implements Serializable{
    @Id
    private Long id;
    private String tipo;
    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Conta conta;
    private String saldoAnterior;
    private String valor;
    private String saldoAtual;
    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Cliente identificador;

    public Operacao() {
    }

    public String getSaldoAtual() {
        return saldoAtual;
    }

    public void setSaldoAtual(String saldoAtual) {
        this.saldoAtual = saldoAtual;
    }

    public Cliente getIdentificador() {
        return identificador;
    }

    public void setIdentificador(Cliente identificador) {
        this.identificador = identificador;
    }

    public Conta getConta() {
        return conta;
    }

    public void setConta(Conta conta) {
        this.conta = conta;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getSaldoAnterior() {
        return saldoAnterior;
    }

    public void setSaldoAnterior(String saldoAnterior) {
        this.saldoAnterior = saldoAnterior;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }
    
    
}
