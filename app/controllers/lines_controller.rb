class LinesController < ApplicationController
    def index
        @lines= Line.all
        @line= Line.new
    end

    def create
        line= Line.create(line_parameters)
        arr = Line.string_2_array(line.score)
        line.populate_frames(arr)
        score = line.to_calculate_score
        line.update(calculate_score: score)
        redirect_to root_path
    end

    private

    def line_parameters
        params.require(:line).permit(:score)
    end
end
