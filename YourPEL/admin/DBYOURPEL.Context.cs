﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace YourPEL.admin
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class YourPELcs : DbContext
    {
        public YourPELcs()
            : base("name=YourPELcs")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<ARTIGO> ARTIGOes { get; set; }
        public virtual DbSet<DOCUMENTO> DOCUMENTOes { get; set; }
        public virtual DbSet<EVENTO> EVENTOes { get; set; }
        public virtual DbSet<PAGINA> PAGINAs { get; set; }
        public virtual DbSet<POST> POSTs { get; set; }
        public virtual DbSet<PUBLICACAO> PUBLICACAOs { get; set; }
        public virtual DbSet<RESPOSTA> RESPOSTAs { get; set; }
        public virtual DbSet<UTILIZADOR> UTILIZADORs { get; set; }
        public virtual DbSet<CLIQUE> CLIQUES { get; set; }
        public virtual DbSet<VISITA> VISITAS { get; set; }
    }
}