module Jekyll
    module QuestionifyFilter
        def questionify(subject, question)
            return "#{question.gsub(/\?$/, '')} #{subject}?"
        end
    end
end

Liquid::Template.register_filter(Jekyll::QuestionifyFilter)
