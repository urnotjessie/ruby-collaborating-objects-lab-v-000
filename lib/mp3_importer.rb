require 'pry'
class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir["#{@path}/*.mp3"].collect do |file|
            file.match(/[A-Z]\w*[^.]*(....)/)[0]
        end
    end

    def import
        self.files.map do |file_name|
            song = Song.new_by_filename(file_name)
            Artis.find_or_create_by_name(song.artist.name)

        end
    end





end
