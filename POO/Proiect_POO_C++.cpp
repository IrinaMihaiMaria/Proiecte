#include <iostream>
#include <vector>
#include <string>

using namespace std;

//clasa de baza
class Persoana
{
protected:
	string nume;
	int varsta;
public:
	//constructor fara parametri
	Persoana()
	{
		this->nume = " ";
		this->varsta = 0;
	}

	//constructor cu parametri
	Persoana(string nume, int varsta)
	{
		this->nume = nume;
		this->varsta = varsta;
	}

	//destructor
	~Persoana()
	{

	}

	//constructor de copiere
	Persoana(const Persoana& altcineva)
	{
		this->nume = altcineva.nume;
		this->varsta = altcineva.varsta;
	}

	//supraincarcarea operatorului de atribuire
	Persoana& operator = (const Persoana& altcineva)
	{
		if (this != &altcineva)
		{
			this->nume = altcineva.nume;
			this->varsta = altcineva.varsta;
		}
		return* this;
	}

	//metode de acces 
	string getNume()
	{
		return nume;
	}
	void setNume(string nume)
	{
		this->nume = nume;
	}

	int getVarsta()
	{
		return varsta;
	}
	void setVarsta(int varsta)
	{
		this->varsta = varsta;
	}

	//supraincarcarea operatorului de afisare

	friend ostream& operator<<(ostream& os, const Persoana& obj)
	{
		os << "Nume: " << obj.nume << "; Varsta: " << obj.varsta;
		return  os;
	}

	//supraincarcarea operatorului de citire

	friend istream& operator>>(istream& is, Persoana& obj)
	{
		cout << "Nume:";
		is >> obj.nume;
		cout << endl;

		cout << "Varsta: ";
		is >> obj.varsta;
		cout << endl;

		return is;
	}

};


//clasa derivata
class Model : public Persoana
{
private:
	float inaltime;
	string culoarePar;
	float greutate;
	string gen;
public:
	//constructor fara parametri
	Model() :Persoana()
	{
		this->inaltime = 0.0f;
		this->culoarePar = " ";
		this->greutate = 0.0f;
		this->gen = " ";
	}

	//constructor cu parametri
	Model(string nume, int varsta, float inaltime, string culoarePar, float greutate, string gen) : Persoana (nume, varsta)
	{
		this->inaltime = 0.0f;
		this->culoarePar = " ";
		this->greutate = 0.0f;
		this->gen = " ";
	}

	//destructor 
	~Model()
	{

	}

	//constructor de copiere
	Model(const Model& altcineva) : Persoana(altcineva)
	{
		this->inaltime=altcineva.inaltime;
		this->culoarePar=altcineva.culoarePar;
		this->greutate= altcineva.greutate ;
		this->gen = altcineva.gen;
	}

	//supraincarcare operator de atribuire
	Model& operator=(const Model& altcineva)
	{
		if (this != &altcineva)
		{
			Persoana::operator=(altcineva);
			this->inaltime = altcineva.inaltime;
			this->culoarePar = altcineva.culoarePar;
			this->greutate = altcineva.greutate;
			this->gen = altcineva.gen;
		}
		return*this;
	}

	//metode de acces

	float getInaltime() const
	{
		return inaltime;
	}
	void setInaltime(float inaltime)
	{
		this->inaltime = inaltime;
	}

	string getCuloarePar()const
	{
		return culoarePar;
	}
	void setCuloarePar(string culoarePar)
	{
		this->culoarePar = culoarePar;
	}

	float getGreutate() const
	{
		return  greutate;
	}
	void setGreutate(float greutate)

	{
		this->greutate = greutate;
	}

	string getGen() const
	{
		return gen;
	}
	void setGen(string gen)
	{
		this->gen = gen;
	}


	//supraincarcarea operatorului de afisare

	friend ostream& operator<<(ostream& os, const Model& obj)
	{
		os << "Inaltime: " << obj.inaltime << "; Culoare par: " << obj.culoarePar << "; Greutate:" << obj.greutate << "; Gen:" << obj.gen;
		return os;
	}

	//supraincarcarea operatorului de citire

	friend istream& operator>>(istream& is, Model& obj)
	{
		cout << "Inaltime:";
		is >> obj.inaltime;
		cout << endl;

		cout << "Culoare par:";
		is >> obj.culoarePar;
		cout << endl;

		cout << "Greutate:";
		is >> obj.greutate;
		cout << endl;

		cout << "Gen:";
		is>> obj.gen;
		cout << endl;

		return is;
	}
};


//clasa derivata
class Agent : public Persoana
{
private:
	int aniExperienta;
	string modele;
public:
	//constuctor fara parametri
	Agent() :Persoana()
	{
		this->aniExperienta = 0;
		this->modele = " ";
	}

	//constructor cu parametri
	Agent(string nume, int varsta, int aniExperienta, string modele) :Persoana(nume, varsta)
	{
		this->aniExperienta = aniExperienta;
		this->modele = modele;
	}

	//destructor
	~Agent()
	{

	}

	//constructor de copiere
	Agent(const Agent& altcineva) : Persoana(altcineva)
	{
		this->aniExperienta = altcineva.aniExperienta;
		this->modele = altcineva.modele;
	}


	//supraincarcarea operatorului de atribuire
	Agent& operator = (const Agent& altcineva)
	{
		if (this != &altcineva)
		{
			Persoana :: operator=(altcineva);
			this->aniExperienta = altcineva.aniExperienta;
			this->modele = altcineva.modele;
		}
		return *this;
	}

	//metode de acces

	int getaniExperienta() const
	{
		return aniExperienta;
	}
	void setaniExperienta(int inaltime)
	{
		this->aniExperienta = inaltime;
	}

	string getModele() const
	{
		return modele;
	}
	void setModele(string modele)
	{
		this->modele = modele;
	}


	//supraincarcarea operatorului de afisare

	friend ostream& operator<<(ostream& os, const Agent& obj)
	{
		os << "Ani de experienta: " << obj.aniExperienta << "; Modele:" << obj.modele;
		return os;
	}

	//supraincarcarea operatorului de citire

	friend istream& operator>>(istream& is, Agent& obj)
	{
		cout << "Ani de experienta:";
		is >> obj.aniExperienta;
		cout << endl;

		cout << "Modele:";
		is >> obj.modele;
		cout << endl;

		return is;
	}
	
};



//clasa cu vector
class AgentieDeModele 
{
protected:
	//vector de pointer la Persoana
	Persoana** persoane;
	//numarul de obiecte Persoana pe care le gestioneaza agentia 
	int lungime;

public:
	//constructor fara parametri
	AgentieDeModele()
	{
		this->lungime = 0;
		this->persoane = new Persoana * [0];
	}

	//constructor cu parametri
	AgentieDeModele(int lungime)
	{
		this->lungime = lungime;
		this->persoane = new Persoana * [this->lungime];
	}

	//destructor 
	~AgentieDeModele()
	{
		delete[] this->persoane;
	}

	//constructor de copiere
	AgentieDeModele(const AgentieDeModele& altcineva)
	{
		this->lungime = altcineva.lungime;
		this->persoane = new Persoana * [this->lungime];
		for (int i = 0; i < this->lungime; i++)
		{
			this->persoane[i] = altcineva.persoane[i];
		}
	}

	//supraincarcarea operatorului de atribuire
	AgentieDeModele& operator = (const AgentieDeModele& altcineva)
	{
		if (this != &altcineva)
		{
			delete[]this->persoane;
			this->lungime = altcineva.lungime;
			this->persoane = new Persoana * [this->lungime];
			for (int i = 0; i < this->lungime; i++)
			{
				this->persoane[i] = altcineva.persoane[i];
			}
		}
		return *this;
	}

	//metode de acces
	
	int getLungime() const
	{
		return lungime;
	}

	void setLungime(int lungime)
	{
		this->lungime = lungime;
	}


	//supraincarcarea operatorului de citire

	friend istream& operator >>(istream& is, AgentieDeModele& obj)
	{
		for (int i = 0; i < obj.lungime; i++)
		{
			is >> *(obj.persoane[i]);
		}
		return is;
	}

	//supraincarcarea operatorului de afisare

	friend ostream& operator<<(ostream& os, const AgentieDeModele& obj)
	{
		for (int i = 0; i < obj.lungime; i++)
		{
			os << *(obj.persoane[i] )<< endl;
		}
		return os;
	}
	
	//+=

	AgentieDeModele& operator+=(Persoana* persoana)
	{
		Persoana** temp = new Persoana * [this->lungime + 1];
		for (int i = 0; i < this->lungime; i++)
		{
			temp[i] = this->persoane[i];
		}
		temp[this->lungime] = persoana;
		this->lungime++;
		delete[] this->persoane;
		this->persoane = temp;
		return *this;
	}



	//-=

	AgentieDeModele& operator-=(Persoana* persoana)
	{
		int index = -1;
		for (int i = 0; i < this->lungime; i++)
		{
			if (this->persoane[i] == persoana)
			{
				index = i;
				break;
			}
		}
		if (index != -1)
		{
			for (int i = index; i < this->lungime - 1; i++)
			{
				this->persoane[i] = this->persoane[i + 1];
			}
			this->lungime--;
		}
		return *this;
	}


	//operatorul de acces pe baza de index
	
	Persoana* operator[](int poz)
	{
		if (poz >= this->lungime || poz<0)
		{
			cout << "Index invalid!" << endl;
			return nullptr;
			
		}
		else
		{
			return this->persoane[poz];
		}
	}
	

};


int main() {

	// Testarea constructorilor

	Persoana persoana1("Ion Popescu", 30);
	Model model1("Maria Ionescu", 25, 1.75f, "brunet", 55.0f, "feminin");
	Agent agent1("George Vasile", 40, 5, "Maria Ionescu");


	// Testarea constructorului de copiere

	Persoana persoana2 = persoana1;
	Model model2 = model1;
	Agent agent2 = agent1;


	// Testarea operatorului de atribuire

	persoana2 = persoana1;
	model2 = model1;
	agent2 = agent1;


	// Testarea metodelor de acces

	cout << "Numele persoanei 1 este: " << persoana1.getNume() << endl;
	cout << "Varsta modelului 1 este: " << model1.getVarsta() << endl;
	cout << "Anii de experienta ai agentului 1 sunt: " << agent1.getaniExperienta() << endl;


	// Testarea supraincarcarii operatorilor de citire si afisare

	cout << "Introduceti date pentru o noua persoana:" << endl;
	cin >> persoana2;
	cout << "Persoana introdusa este: " << persoana2 << endl;


	// Testarea clasei cu vector

	AgentieDeModele agentie;
	agentie += &persoana1;
	agentie += &model1;
	agentie += &agent1;

	cout << "Agentia dupa adaugarea persoanelor:" << endl;
	cout << agentie;


	// Testarea supraincarcarii operatorului -=

	agentie -= &persoana1;
	cout << "Agentia dupa eliminarea unei persoane:" << endl;
	cout << agentie;


	// Testarea operatorului de acces pe baza de index

	Persoana* persoanaAccesata = agentie[0];
	if (persoanaAccesata != nullptr) {
		cout << "Persoana accesata este: " << *persoanaAccesata << endl;
	}
	
	return 0;
}

