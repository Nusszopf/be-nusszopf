CREATE TABLE public.leads (
    id uuid NOT NULL,
    name text
);
ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);
