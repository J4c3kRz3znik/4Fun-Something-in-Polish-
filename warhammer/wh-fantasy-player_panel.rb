require 'Qt4'
require 'socket'
require 'base64'
require 'digest'
require 'time'

class CharacterGenerator < Qt::Dialog
    def initialize
        super
        
        setWindowTitle "Warhammer - Character Generator"
        
        char_gen
        
        resize 400, 100
        move 300, 500
        
        show
    end
    
    def char_gen
        hbox = Qt::HBoxLayout.new
        vbox1 = Qt::VBoxLayout.new
        vbox2 = Qt::VBoxLayout.new
        vbox3 = Qt::VBoxLayout.new
        vbox4 = Qt::VBoxLayout.new
        vbox5 = Qt::VBoxLayout.new
        vbox6 = Qt::VBoxLayout.new
        vbox7 = Qt::VBoxLayout.new
        vbox8 = Qt::VBoxLayout.new
        vbox9 = Qt::VBoxLayout.new
        vbox10 = Qt::VBoxLayout.new
        vbox11 = Qt::VBoxLayout.new
        vbox12 = Qt::VBoxLayout.new
        vbox13 = Qt::VBoxLayout.new
        vbox14 = Qt::VBoxLayout.new
        vbox15 = Qt::VBoxLayout.new
        vbox16 = Qt::VBoxLayout.new
        
        #Combo - Race
        @lrace = Qt::ComboBox.new
        
        @lrace.addItem "Czlowiek"
        @lrace.addItem "Elf"
        @lrace.addItem "Niziolek"
        @lrace.addItem "Krasnolod"
        @lrace.addItem "Losowo"
        
        lww = Qt::Label.new("WW")
        rww = Qt::Label.new
        lus = Qt::Label.new("US")
        rus = Qt::Label.new
        lk = Qt::Label.new(" K")
        rk = Qt::Label.new
        lodp = Qt::Label.new("Odp")
        rodp = Qt::Label.new
        lzr = Qt::Label.new("ZR")
        rzr = Qt::Label.new
        lint = Qt::Label.new("INT")
        rint = Qt::Label.new
        lsw = Qt::Label.new("SW")
        rsw = Qt::Label.new
        logd = Qt::Label.new("OGD")
        rogd = Qt::Label.new
        la = Qt::Label.new(" A")
        ra = Qt::Label.new
        lzyw = Qt::Label.new("Żyw")
        rzyw = Qt::Label.new
        ls = Qt::Label.new(" S")
        rs = Qt::Label.new
        lwt = Qt::Label.new("Wt")
        rwt = Qt::Label.new
        lsz = Qt::Label.new("Sz")
        rsz = Qt::Label.new
        lmag = Qt::Label.new("MAG")
        rmag = Qt::Label.new
        lpp = Qt::Label.new("PP")
        rpp = Qt::Label.new
        @race = Qt::Label.new("Rasa")
        #WW US K Odp Zr Int SW Ogd A Żyw S Wt Sz Mag
        
        g = Qt::PushButton.new("Generate")
        
        
        hbox.addLayout vbox1
        hbox.addLayout vbox2
        hbox.addLayout vbox3
        hbox.addLayout vbox4
        hbox.addLayout vbox5
        hbox.addLayout vbox6
        hbox.addLayout vbox7
        hbox.addLayout vbox8
        hbox.addLayout vbox9
        hbox.addLayout vbox10
        hbox.addLayout vbox11
        hbox.addLayout vbox12
        hbox.addLayout vbox13
        hbox.addLayout vbox14
        hbox.addLayout vbox15
        hbox.addLayout vbox16
        vbox1.addWidget @lrace
        vbox1.addWidget g ,1, Qt::AlignTop
        vbox1.addWidget @race
        vbox2.addWidget lww
        vbox2.addWidget rww ,1, Qt::AlignTop
        vbox3.addWidget lus
        vbox3.addWidget rus ,1, Qt::AlignTop
        vbox4.addWidget lk
        vbox4.addWidget rk ,1, Qt::AlignTop
        vbox5.addWidget lodp
        vbox5.addWidget rodp ,1, Qt::AlignTop
        vbox6.addWidget lzr
        vbox6.addWidget rzr ,1, Qt::AlignTop
        vbox7.addWidget lint
        vbox7.addWidget rint ,1, Qt::AlignTop
        vbox8.addWidget lsw
        vbox8.addWidget rsw ,1, Qt::AlignTop
        vbox9.addWidget logd
        vbox9.addWidget rogd ,1, Qt::AlignTop
        vbox10.addWidget la
        vbox10.addWidget ra ,1, Qt::AlignTop
        vbox11.addWidget lzyw
        vbox11.addWidget rzyw ,1, Qt::AlignTop
        vbox12.addWidget ls
        vbox12.addWidget rs ,1, Qt::AlignTop
        vbox13.addWidget lwt
        vbox13.addWidget rwt ,1, Qt::AlignTop
        vbox14.addWidget lsz
        vbox14.addWidget rsz ,1, Qt::AlignTop
        vbox15.addWidget lmag
        vbox15.addWidget rmag ,1, Qt::AlignTop
        vbox16.addWidget lpp
        vbox16.addWidget rpp ,1, Qt::AlignTop
        
        setLayout hbox
        
        g.connect( SIGNAL( :clicked )) do
            @c = @lrace.currentText
            #puts @c
            case @c.to_s
            when "Czlowiek"
                r = Random.new
                ww = r.rand(1 .. 20) + 20
                rww.text="|#{ww}|"
                us = r.rand(1 .. 20) + 20
                rus.text="|#{us}|"
                k = r.rand(1 .. 20) + 20
                rk.text="|#{k}|"
                odp = r.rand(1 .. 20) + 20
                rodp.text="|#{odp}|"
                zr = r.rand(1 .. 20) + 20
                rzr.text="|#{zr}|"
                int = r.rand(1 .. 20) + 20
                rint.text="|#{int}|"
                sw = r.rand(1 .. 20) + 20
                rsw.text="|#{sw}|"
                ogd = r.rand(1 .. 20) + 20
                rogd.text="|#{ogd}|"
                ra.text="|#{1}|"
                zyw = r.rand(10 .. 13)
                rzyw.text="|#{zyw}|"
                s = k * 0.1
                rs.text="|#{s.to_int}|"
                wt = odp * 0.1
                rwt.text="|#{wt.to_int}|"
                rsz.text="|4|"
                rmag.text="|0|"
                pp = r.rand(2 .. 3)
                rpp.text="|#{pp}|"
                @race.text="#{@c}"
            when "Elf"
                r = Random.new
                ww = r.rand(1 .. 20) + 20
                rww.text="|#{ww}|"
                us = r.rand(1 .. 20) + 30
                rus.text="|#{us}|"
                k = r.rand(1 .. 20) + 20
                rk.text="|#{k}|"
                odp = r.rand(1 .. 20) + 20
                rodp.text="|#{odp}|"
                zr = r.rand(1 .. 20) + 30
                rzr.text="|#{zr}|"
                int = r.rand(1 .. 20) + 20
                rint.text="|#{int}|"
                sw = r.rand(1 .. 20) + 20
                rsw.text="|#{sw}|"
                ogd = r.rand(1 .. 20) + 20
                rogd.text="|#{ogd}|"
                ra.text="|#{1}|"
                zyw = r.rand(9 .. 12)
                rzyw.text="|#{zyw}|"
                s = k * 0.1
                rs.text="|#{s.to_int}|"
                wt = odp * 0.1
                rwt.text="|#{wt.to_int}|"
                rsz.text="|5|"
                rmag.text="|0|"
                pp = r.rand(1 .. 2)
                rpp.text="|#{pp}|"
                @race.text="#{@c}"
            when "Niziolek"
                r = Random.new
                ww = r.rand(1 .. 20) + 10
                rww.text="|#{ww}|"
                us = r.rand(1 .. 20) + 30
                rus.text="|#{us}|"
                k = r.rand(1 .. 20) + 10
                rk.text="|#{k}|"
                odp = r.rand(1 .. 20) + 10
                rodp.text="|#{odp}|"
                zr = r.rand(1 .. 20) + 30
                rzr.text="|#{zr}|"
                int = r.rand(1 .. 20) + 20
                rint.text="|#{int}|"
                sw = r.rand(1 .. 20) + 20
                rsw.text="|#{sw}|"
                ogd = r.rand(1 .. 20) + 30
                rogd.text="|#{ogd}|"
                ra.text="|#{1}|"
                zyw = r.rand(8 .. 11)
                rzyw.text="|#{zyw}|"
                s = k * 0.1
                rs.text="|#{s.to_int}|"
                wt = odp * 0.1
                rwt.text="|#{wt.to_int}|"
                rsz.text="|4|"
                rmag.text="|0|"
                pp = r.rand(2 .. 3)
                rpp.text="|#{pp}|"
                @race.text="#{@c}"
            when "Krasnolod"
                r = Random.new
                ww = r.rand(1 .. 20) + 30
                rww.text="|#{ww}|"
                us = r.rand(1 .. 20) + 20
                rus.text="|#{us}|"
                k = r.rand(1 .. 20) + 20
                rk.text="|#{k}|"
                odp = r.rand(1 .. 20) + 30
                rodp.text="|#{odp}|"
                zr = r.rand(1 .. 20) + 10
                rzr.text="|#{zr}|"
                int = r.rand(1 .. 20) + 20
                rint.text="|#{int}|"
                sw = r.rand(1 .. 20) + 20
                rsw.text="|#{sw}|"
                ogd = r.rand(1 .. 20) + 10
                rogd.text="|#{ogd}|"
                ra.text="|#{1}|"
                zyw = r.rand(11 .. 14)
                rzyw.text="|#{zyw}|"
                s = k * 0.1
                rs.text="|#{s.to_int}|"
                wt = odp * 0.1
                rwt.text="|#{wt.to_int}|"
                rsz.text="|3|"
                rmag.text="|0|"
                pp = r.rand(1 .. 3)
                rpp.text="|#{pp}|"
                @race.text="#{@c}"
            when "Losowo"
                race_array = []
                race_array << "Czlowiek"
                race_array << "Elf"
                race_array << "Niziolek"
                race_array << "Krasnolod"
                race = Random.new
                
                random_race = race_array[race.rand(0 .. 3)]
                case random_race
                when "Czlowiek"
                    r = Random.new
                    ww = r.rand(1 .. 20) + 20
                    rww.text="|#{ww}|"
                    us = r.rand(1 .. 20) + 20
                    rus.text="|#{us}|"
                    k = r.rand(1 .. 20) + 20
                    rk.text="|#{k}|"
                    odp = r.rand(1 .. 20) + 20
                    rodp.text="|#{odp}|"
                    zr = r.rand(1 .. 20) + 20
                    rzr.text="|#{zr}|"
                    int = r.rand(1 .. 20) + 20
                    rint.text="|#{int}|"
                    sw = r.rand(1 .. 20) + 20
                    rsw.text="|#{sw}|"
                    ogd = r.rand(1 .. 20) + 20
                    rogd.text="|#{ogd}|"
                    ra.text="|#{1}|"
                    zyw = r.rand(10 .. 13)
                    rzyw.text="|#{zyw}|"
                    s = k * 0.1
                    rs.text="|#{s.to_int}|"
                    wt = odp * 0.1
                    rwt.text="|#{wt.to_int}|"
                    rsz.text="|4|"
                    rmag.text="|0|"
                    pp = r.rand(2 .. 3)
                    rpp.text="|#{pp}|"
                    @race.text="#{random_race}"
                when "Elf"
                    r = Random.new
                    ww = r.rand(1 .. 20) + 20
                    rww.text="|#{ww}|"
                    us = r.rand(1 .. 20) + 30
                    rus.text="|#{us}|"
                    k = r.rand(1 .. 20) + 20
                    rk.text="|#{k}|"
                    odp = r.rand(1 .. 20) + 20
                    rodp.text="|#{odp}|"
                    zr = r.rand(1 .. 20) + 30
                    rzr.text="|#{zr}|"
                    int = r.rand(1 .. 20) + 20
                    rint.text="|#{int}|"
                    sw = r.rand(1 .. 20) + 20
                    rsw.text="|#{sw}|"
                    ogd = r.rand(1 .. 20) + 20
                    rogd.text="|#{ogd}|"
                    ra.text="|#{1}|"
                    zyw = r.rand(9 .. 12)
                    rzyw.text="|#{zyw}|"
                    s = k * 0.1
                    rs.text="|#{s.to_int}|"
                    wt = odp * 0.1
                    rwt.text="|#{wt.to_int}|"
                    rsz.text="|5|"
                    rmag.text="|0|"
                    pp = r.rand(1 .. 2)
                    rpp.text="|#{pp}|"
                    @race.text="#{random_race}"
                when "Niziolek"
                    r = Random.new
                    ww = r.rand(1 .. 20) + 10
                    rww.text="|#{ww}|"
                    us = r.rand(1 .. 20) + 30
                    rus.text="|#{us}|"
                    k = r.rand(1 .. 20) + 10
                    rk.text="|#{k}|"
                    odp = r.rand(1 .. 20) + 10
                    rodp.text="|#{odp}|"
                    zr = r.rand(1 .. 20) + 30
                    rzr.text="|#{zr}|"
                    int = r.rand(1 .. 20) + 20
                    rint.text="|#{int}|"
                    sw = r.rand(1 .. 20) + 20
                    rsw.text="|#{sw}|"
                    ogd = r.rand(1 .. 20) + 30
                    rogd.text="|#{ogd}|"
                    ra.text="|#{1}|"
                    zyw = r.rand(8 .. 11)
                    rzyw.text="|#{zyw}|"
                    s = k * 0.1
                    rs.text="|#{s.to_int}|"
                    wt = odp * 0.1
                    rwt.text="|#{wt.to_int}|"
                    rsz.text="|4|"
                    rmag.text="|0|"
                    pp = r.rand(2 .. 3)
                    rpp.text="|#{pp}|"
                    @race.text="#{random_race}"
                when "Krasnolod"
                    r = Random.new
                    ww = r.rand(1 .. 20) + 30
                    rww.text="|#{ww}|"
                    us = r.rand(1 .. 20) + 20
                    rus.text="|#{us}|"
                    k = r.rand(1 .. 20) + 20
                    rk.text="|#{k}|"
                    odp = r.rand(1 .. 20) + 30
                    rodp.text="|#{odp}|"
                    zr = r.rand(1 .. 20) + 10
                    rzr.text="|#{zr}|"
                    int = r.rand(1 .. 20) + 20
                    rint.text="|#{int}|"
                    sw = r.rand(1 .. 20) + 20
                    rsw.text="|#{sw}|"
                    ogd = r.rand(1 .. 20) + 10
                    rogd.text="|#{ogd}|"
                    ra.text="|#{1}|"
                    zyw = r.rand(11 .. 14)
                    rzyw.text="|#{zyw}|"
                    s = k * 0.1
                    rs.text="|#{s.to_int}|"
                    wt = odp * 0.1
                    rwt.text="|#{wt.to_int}|"
                    rsz.text="|3|"
                    rmag.text="|0|"
                    pp = r.rand(1 .. 3)
                    rpp.text="|#{pp}|"
                    @race.text="#{random_race}"
                end
            else
                puts "wtf?"
            end
            
        end
        
    end
end
  
class Dices < Qt::Dialog
    
    def initialize
        super
        
        setWindowTitle "Warhammer - Dices"
        
        dices
        
        resize 500, 300
        move 300, 500
        
        show
    end
    
    def dices
        
        vbox = Qt::VBoxLayout.new
        hbox1 = Qt::HBoxLayout.new
        hbox2 = Qt::HBoxLayout.new
        vbox1 = Qt::VBoxLayout.new
        vbox2 = Qt::VBoxLayout.new
        vbox3 = Qt::VBoxLayout.new
        vbox4 = Qt::VBoxLayout.new
        vbox5 = Qt::VBoxLayout.new
        
        dk4 = Qt::PushButton.new("Dice k4")
        @dk4lab = Qt::Label.new("Result: ")
        @dk4edit = Qt::LineEdit.new
        dk6 = Qt::PushButton.new("Dice k6")
        @dk6lab = Qt::Label.new("Result: ")
        @dk6edit = Qt::LineEdit.new
        dk8 = Qt::PushButton.new("Dice k8")
        @dk8lab = Qt::Label.new("Result: ")
        @dk8edit = Qt::LineEdit.new
        dk10 = Qt::PushButton.new("Dice k10")
        @dk10lab = Qt::Label.new("Result: ")
        @dk10edit = Qt::LineEdit.new
        dk100 = Qt::PushButton.new("Dice k100")
        @dk100lab = Qt::Label.new("Result: ")
        @dk100edit = Qt::LineEdit.new
        @resultlog = Qt::TextEdit.new
        
        
        #puts methtest.methods
        
        def rollk4
            x = @dk4edit.displayText
            Thread.new{
                begin
                    if x == ""
                        x = "1"
                    elsif x.to_i > 10
                        x = 10
                    end
                    r4 = []
                    x.to_i.times do
                        d4 = Random.new
                        r4 << d4.rand(1 .. 4)
                    end
                    r4.each do |line|
                        t = Time.new
                        Qt.execute_in_main_thread{@resultlog.append "Wynik Kości K4: #{line} - #{t}"}
                    end
                    r4.clear
                rescue
                    puts "Something is not good"
            end
            }
        end
        
        def rollk6
            x = @dk6edit.displayText
            Thread.new{
            begin
                if x == ""
                    x = "1"
                elsif x.to_i > 10
                    x = 10
                end
                r6 = []
                x.to_i.times do
                    d6 = Random.new
                    r6 << d6.rand(1 .. 6)
                end
                r6.each do |line|
                    t = Time.new
                    Qt.execute_in_main_thread{@resultlog.append "Wynik Kości K6: #{line} - #{t}"}
                end
                r6.clear
            rescue
                    puts "Something is not good"
            end
            }
        end
        
        def rollk8
            x = @dk8edit.displayText
            Thread.new{
                begin
                    if x == ""
                        x = "1"
                    elsif x.to_i > 10
                        x = 10
                    end
                    r8 = []
                    x.to_i.times do
                        d8 = Random.new
                        r8 << d8.rand(1 .. 8)
                    end
                    r8.each do |line|
                        t = Time.new
                        Qt.execute_in_main_thread{@resultlog.append "Wynik Kości K8: #{line} - #{t}"}
                    end
                    r8.clear
                rescue
                    puts "Something is not good"
            end
            }
        end
        
        def rollk10
            x = @dk10edit.displayText
            Thread.new{
            begin
            if x == ""
                x = "1"
            elsif x.to_i > 10
                x = 10
            end
            r10 = []
            x.to_i.times do
                d10 = Random.new
                r10 << d10.rand(1 .. 10)
            end
            r10.each do |line|
                t = Time.new
                Qt.execute_in_main_thread{@resultlog.append "Wynik Kości K10: #{line} - #{t}"}
            end
            r10.clear
            rescue
                    puts "Something is not good"
            end
            }
        end
        
        def rollk100
            x = @dk100edit.displayText
            Thread.new{
            begin
            if x == ""
                x = "1"
            elsif x.to_i > 10
                x = 10
            end
            r100 = []
            x.to_i.times do
                d100 = Random.new
                r100 << d100.rand(1 .. 100)
            end
            r100.each do |line|
                t = Time.new
                Qt.execute_in_main_thread{@resultlog.append "Wynik Kości K100: #{line} - #{t}"}
            end
            r100.clear
            rescue
                    puts "Something is not good"
            end
            }
        end
        
        dk4.connect( SIGNAL( :clicked )) do
            rollk4
        end
        
        dk6.connect( SIGNAL( :clicked )) do
            rollk6
        end
        
        dk8.connect( SIGNAL( :clicked )) do
            rollk8
        end
        
        dk10.connect( SIGNAL( :clicked )) do
            rollk10
        end
        
        dk100.connect( SIGNAL( :clicked )) do
            rollk100
        end
        
        vbox.addLayout hbox1
        vbox.addLayout hbox2
        hbox1.addLayout vbox1
        hbox1.addLayout vbox2
        hbox1.addLayout vbox3
        hbox1.addLayout vbox4
        hbox1.addLayout vbox5
        hbox2.addWidget @resultlog
        
        vbox1.addWidget dk4
        vbox1.addWidget @dk4edit, Qt::AlignTop
        
        vbox2.addWidget dk6
        vbox2.addWidget @dk6edit, Qt::AlignTop
        
        vbox3.addWidget dk8
        vbox3.addWidget @dk8edit, Qt::AlignTop
        
        vbox4.addWidget dk10
        vbox4.addWidget @dk10edit, Qt::AlignTop
        
        vbox5.addWidget dk100
        vbox5.addWidget @dk100edit, Qt::AlignTop
        
        setLayout vbox
        
    end
end

class OnlineDices < Qt::Dialog
    
    
    def initialize
        super
        
        setWindowTitle "Warhammer - Online Panel"
        
        init_ui
        
        resize 230, 70
        move 300, 300

        show
    end
    
    def init_ui
        
        mbox = Qt::VBoxLayout.new
        vbox = Qt::VBoxLayout.new
        hbox1 = Qt::HBoxLayout.new
        hbox2 = Qt::HBoxLayout.new
        vbox1 = Qt::VBoxLayout.new
        vbox2 = Qt::VBoxLayout.new
        vbox3 = Qt::VBoxLayout.new
        vbox4 = Qt::VBoxLayout.new
        vbox5 = Qt::VBoxLayout.new
        vbox6 = Qt::VBoxLayout.new
        
        minhbox = Qt::HBoxLayout.new
        
        @name = Qt::LineEdit.new
        @lname = Qt::Label.new("Nazwa Postaci:")
        dk4 = Qt::PushButton.new("Dice k4")
        @dk4lab = Qt::Label.new("Ile Kosci:")
        @dk4edit = Qt::LineEdit.new
        dk6 = Qt::PushButton.new("Dice k6")
        @dk6lab = Qt::Label.new("Ile Kosci:")
        @dk6edit = Qt::LineEdit.new
        dk8 = Qt::PushButton.new("Dice k8")
        @dk8lab = Qt::Label.new("Ile Kosci:")
        @dk8edit = Qt::LineEdit.new
        dk10 = Qt::PushButton.new("Dice k10")
        @dk10lab = Qt::Label.new("Ile Kosci:")
        @dk10edit = Qt::LineEdit.new
        dk100 = Qt::PushButton.new("Dice k100")
        @dk100lab = Qt::Label.new("Ile Kosci:")
        @dk100edit = Qt::LineEdit.new
        
        @plusb = Qt::PushButton.new("+")
        @ehp = Qt::LineEdit.new
        @minusb = Qt::PushButton.new("-")
        @mhp = Qt::PushButton.new("Wyślij do GM")
        
        @resultlog = Qt::TextEdit.new
        
        def minhp
            x = @ehp.displayText.to_i
            x -=1
            nn = @name.displayText
            Thread.new{
            Qt.execute_in_main_thread{@ehp.text=("#{x}")}
            $t.puts "HP:#{nn}:#{x}"
            }
        end
        
        def pluhp
            x = @ehp.displayText.to_i
            x +=1
            nn = @name.displayText
            Thread.new{
            Qt.execute_in_main_thread{@ehp.text=("#{x}")}
            $t.puts "HP:#{nn}:#{x}"
            }
        end
        
        def shp
            x = @ehp.displayText
            nn = @name.displayText
            Thread.new{
            $t.puts "HP:#{nn}:#{x}"
            }
        end
        
        
        def rollk4
            x = @dk4edit.displayText
            nn = @name.displayText
            Thread.new{
            if x == ""
                x = "1"
            elsif x.to_i > 10
                x = 10
            end
            @r4 = []
            x.to_i.times do
                d4 = Random.new
                d = d4.rand(1 .. 4)
                @r4 << d
                $t.puts "DC:Gracz #{nn} WYNIK=#{d} k4"
            end
            @r4.each do |line|
                        t = Time.new
                        Qt.execute_in_main_thread{@resultlog.append "Wynik Kości K4: #{line} - #{t}"}
                    end
            #$t.puts "Gracz #{name.displayText} wyrzucił: #{@r4}"
            @r4.clear
            }
        end
        
        def rollk6
            x = @dk6edit.displayText
            nn = @name.displayText
            Thread.new{
            if x == ""
                x = "1"
            elsif x.to_i > 10
                x = 10
            end
            @r6 = []
            x.to_i.times do
                d6 = Random.new
                d = d6.rand(1 .. 6)
                @r6 << d
                $t.puts "DC:Gracz #{nn} WYNIK=#{d} k6"
            end
            @r6.each do |line|
                        t = Time.new
                        Qt.execute_in_main_thread{@resultlog.append "Wynik Kości K6: #{line} - #{t}"}
                    end
            @r6.clear
            }
        end
        
        def rollk8
            x = @dk8edit.displayText
            nn = @name.displayText
            Thread.new{
            if x == ""
                x = "1"
            elsif x.to_i > 10
                x = 10
            end
            @r8 = []
            x.to_i.times do
                d8 = Random.new
                d = d8.rand(1 .. 8)
                @r8 << d
                $t.puts "DC:Gracz #{nn} WYNIK=#{d} k8"
            end
            @r8.each do |line|
                        t = Time.new
                        Qt.execute_in_main_thread{@resultlog.append "Wynik Kości K8: #{line} - #{t}"}
                    end
            @r8.clear
            }
        end
        
        def rollk10
            x = @dk10edit.displayText
            nn = @name.displayText
            Thread.new{
            if x == ""
                x = "1"
            elsif x.to_i > 10
                x = 10
            end
            @r10 = []
            x.to_i.times do
                d10 = Random.new
                d = d10.rand(1 .. 10)
                @r10 << d
                $t.puts "DC:Gracz #{nn} WYNIK=#{d} k10"
            end
            @r10.each do |line|
                        t = Time.new
                        Qt.execute_in_main_thread{@resultlog.append "Wynik Kości K10: #{line} - #{t}"}
                    end
            @r10.clear
            }
        end
        
        def rollk100
            x = @dk100edit.displayText
            nn = @name.displayText
            Thread.new{
            if x == ""
                x = "1"
            elsif x.to_i > 10
                x = 10
            end
            @r100 = []
            x.to_i.times do
                d100 = Random.new
                d = d100.rand(1 .. 100)
                @r100 << d
                $t.puts "DC:Gracz #{nn} WYNIK=#{d} k100"
            end
            @r100.each do |line|
                        t = Time.new
                        Qt.execute_in_main_thread{@resultlog.append "Wynik Kości K100: #{line} - #{t}"}
                    end
            @r100.clear
            }
        end
        
        #puts methtest.methods
        
        dk4.connect( SIGNAL( :clicked )) do
            rollk4
        end
        
        dk6.connect( SIGNAL( :clicked )) do
            rollk6
        end
        
        dk8.connect( SIGNAL( :clicked )) do
            rollk8
        end
        
        dk10.connect( SIGNAL( :clicked )) do
            rollk10
        end
        
        dk100.connect( SIGNAL( :clicked )) do
            rollk100
        end
        
        @mhp.connect(SIGNAL(:clicked)) do
            shp
        end
        
        @plusb.connect(SIGNAL(:clicked)) do
            pluhp
        end
        
        @minusb.connect(SIGNAL(:clicked)) do
            minhp
        end
        
        mbox.addWidget @lname
        mbox.addWidget @name
        mbox.addLayout vbox
        vbox.addLayout hbox1
        vbox.addLayout hbox2
        hbox2.addWidget @resultlog
        hbox1.addLayout vbox1
        hbox1.addLayout vbox2
        hbox1.addLayout vbox3
        hbox1.addLayout vbox4
        hbox1.addLayout vbox5
        hbox1.addLayout vbox6
        vbox1.addWidget dk4
        vbox1.addWidget @dk4lab,1, Qt::AlignTop
        vbox1.addWidget @dk4edit, Qt::AlignTop
        
        vbox2.addWidget dk6
        vbox2.addWidget @dk6lab,1, Qt::AlignTop
        vbox2.addWidget @dk6edit, Qt::AlignTop
        
        vbox3.addWidget dk8
        vbox3.addWidget @dk8lab,1, Qt::AlignTop
        vbox3.addWidget @dk8edit, Qt::AlignTop
        
        vbox4.addWidget dk10
        vbox4.addWidget @dk10lab,1, Qt::AlignTop
        vbox4.addWidget @dk10edit, Qt::AlignTop
        
        vbox5.addWidget dk100
        vbox5.addWidget @dk100lab,1, Qt::AlignTop
        vbox5.addWidget @dk100edit, Qt::AlignTop
        
        vbox6.addWidget @ehp, 1, Qt::AlignTop
        vbox6.addWidget @mhp, Qt::AlignTop
        minhbox.addWidget @plusb
        minhbox.addWidget @minusb
        vbox6.addLayout minhbox, Qt::AlignTop
        
        setLayout mbox 
        
    end    
    
end

class Menu < Qt::Widget
    
    def initialize
        super
        
        init_ui
        
        resize 230, 70
        move 300, 300

        show
    end
    
    def init_ui
        vbox = Qt::VBoxLayout.new 
        hbox = Qt::HBoxLayout.new
        tphbox = Qt::HBoxLayout.new
        
        dices = Qt::PushButton.new "Kości"
        generator = Qt::PushButton.new "Generator Postaci"
        gm_ip = Qt::LineEdit.new
        gm_code = Qt::LineEdit.new
        tcpstatus = Qt::Label.new("Status: Nie Zalogowano")
        lab_ip = Qt::Label.new("Ip:")
        lab_code = Qt::Label.new("Code:")
        
        conntcp = Qt::PushButton.new "Połącz z GM"
        
        #puts conntcp.methods
        
        conntcp.connect(SIGNAL(:clicked)) do
            @@ip = gm_ip.displayText
            @@code = gm_code.displayText
            @@c = Digest::SHA2.hexdigest "#{@@code}"
            if not conntcp.isChecked
                begin
                    $t = TCPSocket.new @ip, 8080
                    $t.puts @@c 
                    @login = $t.recv(100)
                    puts @login
                    case @login.to_s
                    when "Logged\n"
                         tcpstatus.text="Zalogowano"
                         conntcp.setCheckable true
                         conntcp.text="Rozłącz"
                    when "Bad Ceredentials\n"
                         tcpstatus.text="Autoryzacja Odrzucona"
                    else
                        tcpstatus.text="Somethin is not good"
                    end
                rescue
                    tcpstatus.text="Błąd połączenia"
                    conntcp.text="Połącz"
                end
            else
                $t.close
                tcpstatus.text="Rozłączono"
                conntcp.text="Połącz"
            end
        end
        
        onlinedices = Qt::PushButton.new "Panel Gracza - Online"
        
        generator.connect(SIGNAL(:clicked)) do
            CharacterGenerator.new
        end
        
        dices.connect(SIGNAL(:clicked)) do
            Dices.new
        end
        
        onlinedices.connect(SIGNAL(:clicked)) do
            if not $t
                Qt::MessageBox.warning self, "WARNING", "Wymaga połączenia z serwerem GM"
            else
                OnlineDices.new
            end
        end
        
        tphbox.addWidget lab_ip
        tphbox.addWidget gm_ip
        tphbox.addWidget lab_code
        tphbox.addWidget gm_code
        
        hbox.addLayout vbox
        vbox.addWidget dices
        vbox.addWidget generator
        vbox.addLayout tphbox
        vbox.addWidget tcpstatus
        vbox.addWidget conntcp
        vbox.addWidget onlinedices
        
        setLayout hbox
        
    end
    
    #def on_clicked
        
    #end
    
end

class Main < Qt::MainWindow
    
    def initialize
        super
        
        setWindowTitle "Warhammer - Player Panel"
        
        setCentralWidget Menu.new
        
        show
    end
end

app = Qt::Application.new ARGV
Main.new
app.exec
