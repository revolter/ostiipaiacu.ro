module Jekyll
    module AnswerifyFilter
        def answerify(answer)
            return "#{answer.capitalize}!"
        end
    end
end

Liquid::Template.register_filter(Jekyll::AnswerifyFilter)
