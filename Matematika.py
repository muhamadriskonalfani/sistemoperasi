class Matematika:
    def __init__(self, nilai1, nilai2, nilai3, nilai4) -> None:
        self.nilai1 = nilai1
        self.nilai2 = nilai2
        self.nilai3 = nilai3
        self.nilai4 = nilai4
        
        hasil = 0
        
    def penjumlahan(self):
        hasil = self.nilai1 + self.nilai2
        return print(hasil)

    def perkalian(self):
        hasil = self.nilai1 * self.nilai2 * self.nilai3
        return print(hasil)

    def pengurangan(self):
        hasil = self.nilai1 - self.nilai2 - self.nilai3 - self.nilai4
        return print(hasil)
    
    def perpangkatan(self):
        hasil = self.nilai1 * self.nilai1
        return print(hasil)

operasi = Matematika(10,10,10,10)
operasi.penjumlahan()
operasi.perkalian()
operasi.pengurangan()
operasi.perpangkatan()
    
