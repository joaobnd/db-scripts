--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 9.5.19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.tarefas DROP CONSTRAINT tarefas_id_key;
ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_pkey;
DROP TABLE public.tarefas;
DROP TABLE public.funcionario;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: funcionario; Type: TABLE; Schema: public; Owner: joaomartins
--

CREATE TABLE public.funcionario (
    cpf character(11) NOT NULL,
    data_nasc date,
    nome text,
    funcao text,
    nivel character(1),
    superior_cpf character(11)
);


ALTER TABLE public.funcionario OWNER TO joaomartins;

--
-- Name: tarefas; Type: TABLE; Schema: public; Owner: joaomartins
--

CREATE TABLE public.tarefas (
    id bigint NOT NULL,
    descricao text NOT NULL,
    func_resp_cpf character(11) NOT NULL,
    prioridade integer NOT NULL,
    status character(1) NOT NULL,
    CONSTRAINT check_prioridade CHECK ((prioridade <= 32767)),
    CONSTRAINT cpf_char_check CHECK ((length(func_resp_cpf) = 11)),
    CONSTRAINT priority_value CHECK (((prioridade >= 0) AND (prioridade <= 5))),
    CONSTRAINT status_value CHECK (((status = 'P'::bpchar) OR (status = 'E'::bpchar) OR (status = 'C'::bpchar)))
);


ALTER TABLE public.tarefas OWNER TO joaomartins;

--
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: joaomartins
--



--
-- Data for Name: tarefas; Type: TABLE DATA; Schema: public; Owner: joaomartins
--

INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (2147483648, 'limpar portas do térreo', '32323232955', 4, 'P');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (2147483653, 'limpar portas do 1o andar', '32323232911', 2, 'P');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (21474312353, 'aparar grama da área frontal', '32323291122', 3, 'P');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (26565312353, 'servir agua', '32323291542', 2, 'P');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (2147483647, 'limpar janelas da sala 203', '98765432122', 1, 'C');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (2147483646, 'limpar chão do corredor central', '98765432111', 0, 'C');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (2147483649, 'limpar janelas da entrada principal', '32325525199', 5, 'P');
INSERT INTO public.tarefas (id, descricao, func_resp_cpf, prioridade, status) VALUES (2147483650, 'limpar portas do 2 andar', '32324525199', 5, 'P');


--
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: joaomartins
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (cpf);


--
-- Name: tarefas_id_key; Type: CONSTRAINT; Schema: public; Owner: joaomartins
--

ALTER TABLE ONLY public.tarefas
    ADD CONSTRAINT tarefas_id_key UNIQUE (id);


--
-- PostgreSQL database dump complete
--

