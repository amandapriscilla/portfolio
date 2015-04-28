namespace SIDAF.UI.FILIAL.Relatorio
{
    partial class frmProdutosEmEstoque
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.gBoxProdEstoque = new System.Windows.Forms.GroupBox();
            this.lblChaveBusca = new System.Windows.Forms.Label();
            this.lblFiltro = new System.Windows.Forms.Label();
            this.cmbBoxFiltro = new System.Windows.Forms.ComboBox();
            this.btnGerar = new System.Windows.Forms.Button();
            this.txtBuscaProduto = new System.Windows.Forms.TextBox();
            this.gBoxResultBusca = new System.Windows.Forms.GroupBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.IdEspecificacao = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.IdTipo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.IdProduto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Produto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PrincAtivo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Especificacao = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Tipo = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.Qtd = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Preco = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gBoxProdEstoque.SuspendLayout();
            this.gBoxResultBusca.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // gBoxProdEstoque
            // 
            this.gBoxProdEstoque.Controls.Add(this.lblChaveBusca);
            this.gBoxProdEstoque.Controls.Add(this.lblFiltro);
            this.gBoxProdEstoque.Controls.Add(this.cmbBoxFiltro);
            this.gBoxProdEstoque.Controls.Add(this.btnGerar);
            this.gBoxProdEstoque.Controls.Add(this.txtBuscaProduto);
            this.gBoxProdEstoque.Location = new System.Drawing.Point(1, 2);
            this.gBoxProdEstoque.Name = "gBoxProdEstoque";
            this.gBoxProdEstoque.Size = new System.Drawing.Size(759, 86);
            this.gBoxProdEstoque.TabIndex = 0;
            this.gBoxProdEstoque.TabStop = false;
            this.gBoxProdEstoque.Text = "Relatório de Produtos em Estoque";
            // 
            // lblChaveBusca
            // 
            this.lblChaveBusca.AutoSize = true;
            this.lblChaveBusca.Location = new System.Drawing.Point(179, 33);
            this.lblChaveBusca.Name = "lblChaveBusca";
            this.lblChaveBusca.Size = new System.Drawing.Size(86, 13);
            this.lblChaveBusca.TabIndex = 9;
            this.lblChaveBusca.Text = "Chave de Busca";
            // 
            // lblFiltro
            // 
            this.lblFiltro.AutoSize = true;
            this.lblFiltro.Location = new System.Drawing.Point(11, 33);
            this.lblFiltro.Name = "lblFiltro";
            this.lblFiltro.Size = new System.Drawing.Size(68, 13);
            this.lblFiltro.TabIndex = 8;
            this.lblFiltro.Text = "Tipo do Filtro";
            // 
            // cmbBoxFiltro
            // 
            this.cmbBoxFiltro.FormattingEnabled = true;
            this.cmbBoxFiltro.Items.AddRange(new object[] {
            "Código do Produto",
            "Nome do Produto",
            "Princípio Ativo"});
            this.cmbBoxFiltro.Location = new System.Drawing.Point(14, 50);
            this.cmbBoxFiltro.Name = "cmbBoxFiltro";
            this.cmbBoxFiltro.Size = new System.Drawing.Size(160, 21);
            this.cmbBoxFiltro.TabIndex = 6;
            // 
            // btnGerar
            // 
            this.btnGerar.Location = new System.Drawing.Point(420, 47);
            this.btnGerar.Name = "btnGerar";
            this.btnGerar.Size = new System.Drawing.Size(75, 23);
            this.btnGerar.TabIndex = 5;
            this.btnGerar.Text = "Gerar";
            this.btnGerar.UseVisualStyleBackColor = true;
            // 
            // txtBuscaProduto
            // 
            this.txtBuscaProduto.Location = new System.Drawing.Point(180, 50);
            this.txtBuscaProduto.Name = "txtBuscaProduto";
            this.txtBuscaProduto.Size = new System.Drawing.Size(157, 20);
            this.txtBuscaProduto.TabIndex = 7;
            // 
            // gBoxResultBusca
            // 
            this.gBoxResultBusca.Controls.Add(this.dataGridView1);
            this.gBoxResultBusca.Location = new System.Drawing.Point(1, 94);
            this.gBoxResultBusca.Name = "gBoxResultBusca";
            this.gBoxResultBusca.Size = new System.Drawing.Size(762, 262);
            this.gBoxResultBusca.TabIndex = 1;
            this.gBoxResultBusca.TabStop = false;
            this.gBoxResultBusca.Text = "Resultado da Busca";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToOrderColumns = true;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.IdEspecificacao,
            this.IdTipo,
            this.IdProduto,
            this.Produto,
            this.PrincAtivo,
            this.Especificacao,
            this.Tipo,
            this.Qtd,
            this.Preco});
            this.dataGridView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView1.Location = new System.Drawing.Point(3, 16);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(756, 243);
            this.dataGridView1.TabIndex = 1;
            // 
            // IdEspecificacao
            // 
            this.IdEspecificacao.HeaderText = "IdEspecificacao";
            this.IdEspecificacao.Name = "IdEspecificacao";
            this.IdEspecificacao.Visible = false;
            // 
            // IdTipo
            // 
            this.IdTipo.HeaderText = "IdTipo";
            this.IdTipo.Name = "IdTipo";
            this.IdTipo.Visible = false;
            // 
            // IdProduto
            // 
            this.IdProduto.HeaderText = "Código";
            this.IdProduto.Name = "IdProduto";
            // 
            // Produto
            // 
            this.Produto.HeaderText = "Produto";
            this.Produto.Name = "Produto";
            this.Produto.Width = 150;
            // 
            // PrincAtivo
            // 
            this.PrincAtivo.HeaderText = "Princípio Ativo";
            this.PrincAtivo.Name = "PrincAtivo";
            // 
            // Especificacao
            // 
            this.Especificacao.HeaderText = "Especificação";
            this.Especificacao.Name = "Especificacao";
            this.Especificacao.Width = 150;
            // 
            // Tipo
            // 
            this.Tipo.HeaderText = "Tipo";
            this.Tipo.Name = "Tipo";
            // 
            // Qtd
            // 
            this.Qtd.HeaderText = "Estoque";
            this.Qtd.Name = "Qtd";
            // 
            // Preco
            // 
            this.Preco.HeaderText = "Preço";
            this.Preco.Name = "Preco";
            // 
            // frmProdutosEmEstoque
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(765, 348);
            this.Controls.Add(this.gBoxResultBusca);
            this.Controls.Add(this.gBoxProdEstoque);
            this.Name = "frmProdutosEmEstoque";
            this.Text = "frmProdutosEmEstoque";
            this.gBoxProdEstoque.ResumeLayout(false);
            this.gBoxProdEstoque.PerformLayout();
            this.gBoxResultBusca.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gBoxProdEstoque;
        private System.Windows.Forms.Label lblChaveBusca;
        private System.Windows.Forms.Label lblFiltro;
        private System.Windows.Forms.ComboBox cmbBoxFiltro;
        private System.Windows.Forms.Button btnGerar;
        private System.Windows.Forms.TextBox txtBuscaProduto;
        private System.Windows.Forms.GroupBox gBoxResultBusca;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn IdEspecificacao;
        private System.Windows.Forms.DataGridViewTextBoxColumn IdTipo;
        private System.Windows.Forms.DataGridViewTextBoxColumn IdProduto;
        private System.Windows.Forms.DataGridViewTextBoxColumn Produto;
        private System.Windows.Forms.DataGridViewTextBoxColumn PrincAtivo;
        private System.Windows.Forms.DataGridViewTextBoxColumn Especificacao;
        private System.Windows.Forms.DataGridViewComboBoxColumn Tipo;
        private System.Windows.Forms.DataGridViewTextBoxColumn Qtd;
        private System.Windows.Forms.DataGridViewTextBoxColumn Preco;
    }
}