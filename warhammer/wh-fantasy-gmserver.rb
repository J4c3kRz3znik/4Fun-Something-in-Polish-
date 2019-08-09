require 'Qt4'
require 'socket'
require 'base64'
require 'digest'

class Dices < Qt::Dialog
    
    
    
    def initialize
        super
        
        setWindowTitle "Warhammer - Dices"
        
        dices
        
        resize 400, 100
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

class Server < Qt::Widget
    def initialize
        super
        
       mainserver
       
    end
    
    $hp = {}
    
    def mainserver 
        
    @@code = $codesocket.displayText
    @@check = Digest::SHA2.hexdigest "#{@@code}"
    begin
    $server = TCPServer.new 8080
    $serverlog.append "Serwer został uruchomiony na porcie 8080"
    Thread.new{
    loop do
        Thread.start($server.accept) do |client|
        begin
        @@first = client.gets
            if not @@first.to_s == @@check.to_s + "\n"
                client.puts "Bad Ceredentials"
                client.close
            else
                client.puts "Logged"
                Qt.execute_in_main_thread{$serverlog.append "Client connect"}
                loop do
                @@sec = client.gets
                @@seca = @@sec.split(":")
                puts @@sec
                case @@seca[0]
                when "HP"
                    $hp["#{@@seca[1]}"] = "#{@@seca[2]}"
                    Qt.execute_in_main_thread{$heallog.text=" "}
                    Qt.execute_in_main_thread{
                                              $hp.each do |key, value|
                                                $heallog.append "#{key.gsub("\n", '')} = #{value.gsub("\n", '')}"
                                             end
                                             }
                when "DC"
                    Qt.execute_in_main_thread{ $gamelog.append "#{@@seca[1].gsub("\n", '')}" }
                else
                    puts "WTF"
                end
                end
            end
    end
        rescue
            Qt.execute_in_main_thread{$serverlog.append "Utracono połączenie z klientem"}
        end
        end
    }
    rescue
        $serverlog.append "Nie można uruchomić serwera"
    end
    end
end


class SMain < Qt::Widget
   def initialize
       super
       
       setWindowTitle "GM Server Panel"
       
       init_ui
       
       resize 600, 200
       move 300,300
       
       show
   end
   
   def init_ui
       
       hbox = Qt::HBoxLayout.new self
       vbox1 = Qt::VBoxLayout.new
       hbox1 = Qt::HBoxLayout.new
       vbox2 = Qt::VBoxLayout.new
       
       initdices = Qt::PushButton.new "Kości"
       lgamelog = Qt::Label.new "Logi Gry:"
       $gamelog = Qt::TextEdit.new
       $gamelog.readOnly=true
       
       lheallog = Qt::Label.new "Wytrzymałość Graczy:"
       $heallog = Qt::TextEdit.new
       $heallog.readOnly=true
       
       lcodesocket = Qt::Label.new "Hasło do połączenia:"
       $codesocket = Qt::LineEdit.new
       
       $lsocketstatus = Qt::Label.new "Status: Nie uruchomiono"
       
       initsocket = Qt::PushButton.new "Uruchom server"
       lserverlog = Qt::Label.new "Logi Servera:"
       $serverlog = Qt::TextEdit.new
       $serverlog.readOnly=true
       
       initsocket.connect(SIGNAL(:clicked)) do
            begin
                if not initsocket.isChecked
                    s = Server.new
                    initsocket.setCheckable true
                    initsocket.text="Wyłącz serwer"
                else
                    $server.close
                    $serverlog.append "Serwer Zastopowany"
                    initsocket.setCheckable false
                    initsocket.text="Uruchom Serwer"
                end
            rescue
                $serverlog.append "Coś jest nie tak"
            end
        end
       
       initdices.connect(SIGNAL(:clicked)) do
          Dices.new 
       end
       
       hbox.addLayout hbox1, Qt::AlignLeft
       hbox.addLayout vbox1, Qt::AlignRight
       hbox1.addLayout vbox2, Qt::AlignTop
       vbox2.addWidget initdices, 0, Qt::AlignTop
       vbox2.addWidget lcodesocket, 0, Qt::AlignTop
       vbox2.addWidget $codesocket, 0,Qt::AlignTop
       vbox2.addWidget initsocket, 0,Qt::AlignTop
       vbox2.addWidget lheallog, 0,Qt::AlignTop
       vbox2.addWidget $heallog, 0,Qt::AlignTop
       vbox1.addWidget $lsocketstatus
       vbox1.addWidget lserverlog
       vbox1.addWidget $serverlog
       vbox1.addWidget lgamelog
       vbox1.addWidget $gamelog

       
       setLayout hbox
   end
end

app = Qt::Application.new ARGV
SMain.new
app.exec
