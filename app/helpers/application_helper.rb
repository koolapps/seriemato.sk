module ApplicationHelper
  CITIES = %w{
Bánovce\ nad\ Bebravou Banská\ Bystrica Banská\ Štiavnica Bardejov Bratislava\ I Bratislava\ II Bratislava\ III Bratislava\ IV Bratislava\ V Brezno Bytča Čadca Detva Dolný\ Kubín Dunajská\ Streda Galanta Gelnica Hlohovec Humenné Ilava Kežmarok Komárno Košice\ I Košice\ II Košice\ III Košice\ IV Košice-okolie Krupina Kysucké\ Nové\ Mesto Levice Levoča Liptovský\ Mikuláš Lučenec Malacky Martin Medzilaborce Michalovce Myjava Námestovo Nitra Nové\ Mesto\ nad\ Váhom Nové\ Zámky Partizánske Pezinok Piešťany Poltár Poprad Považská\ Bystrica Prešov Prievidza Púchov Revúca Rimavská\ Sobota Rožňava Ružomberok Sabinov Senec Senica Skalica Snina Sobrance Spišská\ Nová\ Ves Stará\ Ľubovňa Stropkov Svidník Šaľa Topoľčany Trebišov Trenčín Trnava Turčianske\ Teplice Tvrdošín Veľký\ Krtíš Vranov\ nad\ Topľou Zlaté\ Moravce Zvolen Žarnovica Žiar\ nad\ Hronom Žilina
  }

  JOBS = %w{
Administratíva Automobilový\ priemysel Baníctvo,\ hutníctvo Bankovníctvo Bezpečnosť\ a\ ochrana Cestovný\ ruch,\ gastro,\ hotelierstvo Doprava,\ špedícia,\ logistika Drevospracujúci\ priemysel Ekonomika,\ financie,\ účtovníctvo Elektrotechnika\ a\ energetika Farmaceutický\ priemysel Chemický\ priemysel Informačné\ technológie Leasing Ľudské\ zdroje\ a\ personalistika Manažment Manažment\ kvality Marketing,\ reklama,\ PR Obchod Poisťovníctvo Poľnohospodárstvo\ a\ potravinárstvo Pomocné\ práce Právo\ a\ legislatíva Prekladateľstvo\ a\ tlmočníctvo Služby Stavebníctvo\ a\ reality Strojárstvo Školstvo,\ vzdelávanie,\ veda,\ výskum Štátna\ správa,\ samospráva Technika,\ rozvoj Telekomunikácie Textilný,\ kožiarsky\ a\ odevný\ priemysel Umenie\ a\ kultúra Vodohospodárstvo,\ lesníctvo,\ životné\ prostredie Vrcholový\ manažment Výroba Zákaznícka\ podpora Zdravotníctvo\ a\ sociálna\ starostlivosť Žurnalistika,\ polygrafia,\ médiá
  }

  def self.years_of_birth
    from = Time.now.year - 15
    to = Time.now.year - 70
    (to..from).to_a.reverse
  end
end
