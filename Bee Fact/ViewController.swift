import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var imageBee: UIImageView!
    @IBOutlet var BtnsButtons: [UIButton]!
    @IBOutlet weak var count: UILabel!
    
    var radius: CGFloat = 20
    var currentIndex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        holderView.layer.cornerRadius = radius
        imageBee.layer.cornerRadius = radius
        
        for btn in BtnsButtons {
            btn.layer.cornerRadius = radius
        }
        setObjet(anim: .transitionFlipFromLeft)
    }
    
// Fonction par rapport a notre Array
    func setObjet(anim: UIView.AnimationOptions) {
        let fact = beeFacts[currentIndex]
        titleLabel.text = fact.title
        descLabel.text = fact.desc
        imageBee.image = fact.imageFormatted
        // Preciser la page
        count.text = String(currentIndex + 1) + "/" + String(beeFacts.count)
        UIView.transition(with: holderView, duration: 1, options: anim, animations: nil, completion: nil)
    }
    
    /**=========================================================
     ====================ACTIONS DE NOS BOUTTONS
     =========================================================*/
    
    // Revenir au precedent
    @IBAction func previus(_ sender: Any) {
        if currentIndex == 0 {
            currentIndex = beeFacts.count - 1
        } else {
            currentIndex -= 1
        }
        setObjet(anim: .transitionFlipFromRight)
    }
    
    // Aléatoir
    @IBAction func random(_ sender: Any) {
        let rand = Int.random(in: 0..<beeFacts.count)
        currentIndex = rand
        setObjet(anim: .transitionFlipFromBottom)
    }
    
    // Action pour passer au suivant et recommencer a zero
    @IBAction func next(_ sender: Any) {
        if currentIndex < beeFacts.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
        setObjet(anim: .transitionFlipFromLeft)
    }
    
    //Notre Array
    var beeFacts = [
        Fact(title: "La première abeille", image: 1, desc: "La première abeille est apparue il y a plus de 100 millions d'années, peu après l'apparition des premières fleurs.\n\nA titre de comparaison, le premier hominidé est apparu il y a 7 millions d'années et les dinosaures ont disparu il y a 65 millions d'années."),
        Fact(title: "Un grand nombre d'espèces", image: 2, desc: "Il existe une très grande variété d'abeilles, les scientifiques en ont dénombré plus de 20000 dans le monde et 1000 juste sur le territoire français."),
        Fact(title: "Une vie courte et intense", image: 3, desc: "La durée de vie d'une abeille est d'environ 30 à 45 jours pour celles vivant au printemps et en éte. Celles d'automne ont une vie plus longue (quelques mois) qui leur permet de passer l'hiver."),
        Fact(title: "Une monarchie absolue", image: 5, desc: "En général, une ruche ne possède qu'une seule reine adulte qui règne en maître sur ses sujets.\n Elle est la seule à être fertile. Son seul rôle est la fertilisation de la ruche.\n Elle est aussi la mère de toutes les abeilles de la ruche.\nElle pond jusqu'à 2000 oeufs par jour !"),
        Fact(title: "Les faux bourdons", image: 4, desc: "C'est le nom donné aux abeilles mâles de la ruche. Dans une colonie de 60000 individus, on de dénombre que 2500 faux bourdons. Ils ont un seul et unique rôle dans la ruche: féconder la reine."),
        Fact(title: "Des insectes multitâches", image: 6, desc: "Au cours de leur courte vie, les abeilles vont exercer au total six métiers dans la ruche:\n- Nettoyeuse\n- Nourrice\n- Architecte\n- Ouvrière\n- Ventileuse\n- Gardienne\n- Butineuse\n\nUne vie bien remplie en somme."),
        Fact(title: "Attention aux radars", image: 7, desc: "En plein vol, une abeille peut voler jusqu'à 30km/h, avec 200 battements d'ailes par secondes."),
        Fact(title: "Un vol nuptial fatal", image: 8, desc: "Le vol nuptial, ou accouplement de la reine avec les faux bourdons s'avère fatal pour ces messieurs.\nEn effet, une fois l'accouplement terminé, le sexe du mâle explose.\n ce qui signifie la fin de la pauvre bête.\n\nQui est la pire avec son homme? La mante religieuse ou la reine des abeilles?"),
        Fact(title: "Le bourdon", image: 9, desc: "Le bourdon n'est pas une abeille. Il ne doir pas être confondu avec l'abeille mâle qui se nomme le faux bourdon.")
    ]
}

struct Fact {
    var title:String
    var image:Int
    var desc:String
    
    var imageFormatted: UIImage? {
        return UIImage(named: String(image))
    }
}


