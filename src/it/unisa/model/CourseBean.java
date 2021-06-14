package it.unisa.model;

public class CourseBean {
	public CourseBean() {
		this.codiceCorso=-1;
		this.CFU=0;
		this.nome="";
		this.docente="";
	}
	
	
	public int getCodiceCorso() {
		return codiceCorso;
	}

	
	public void setCodiceCorso(int codiceCorso) {
		this.codiceCorso = codiceCorso;
	}
	
	
	public int getCFU() {
		return CFU;
	}
	
	
	public void setCFU(int cFU) {
		CFU = cFU;
	}
	
	
	public String getNome() {
		return nome;
	}
	
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
	public String getDocente() {
		return docente;
	}
	
	
	public void setDocente(String docente) {
		this.docente = docente;
	}

	
	public boolean isEmpty() {
		return this.codiceCorso==-1;
	}

	
	public boolean equals(Object obj) {
		return this.getCodiceCorso()==((CourseBean)obj).getCodiceCorso();
	}

	
	@Override
	public String toString() {
		return "CourseBean [codiceCorso=" + codiceCorso + ", CFU=" + CFU + ", nome=" + nome + ", docente=" + docente
				+ "]";
	}


	private int codiceCorso;
    private int CFU;
    private String nome;
	private String docente;
}
