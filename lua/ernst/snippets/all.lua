local ls = require("luasnip")

local snippet = ls.snippet
local fn = ls.function_node
local t = ls.text_node
local i = ls.insert_node

local date = function() return { os.date('%Y-%m-%d') } end

return {
    snippet('venv', {
        t({ 'VIRTUAL_ENV_PROMPT="', '' }),
        t('%{$fg[red]%}('),
        i(0),
        t(')%{$reset_color%}"'),
    }),
    snippet({
        trig = "date",
        namr = "Date",
        dscr = "Date in the form of YYYY-MM-DD",
    }, {
        fn(date, {}),
    }),

    snippet('lorem', {
        t('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam ' ..
            'nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, ' ..
            'sed diam voluptua. At vero eos et accusam et justo duo dolores et ea ' ..
            'rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ' ..
            'ipsum dolor sit amet.')
    }),
    snippet('llorem', {
        t(
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam ' ..
            'nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, ' ..
            'sed diam voluptua. At vero eos et accusam et justo duo dolores et ea ' ..
            'rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ' ..
            'ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing ' ..
            'elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna ' ..
            'aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo ' ..
            'dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus ' ..
            'est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur ' ..
            'sadipscing elitr, sed diam est Lorem ipsum dolor sit amet erat. ' ..
            'Nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam, ' ..
            'sed diam voluptua. At vero eos et accusam et justo duo dolores et ea ' ..
            'rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ' ..
            'ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing ' ..
            'elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna ' ..
            'aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo ' ..
            'dolores et ea rebum. Stet clita kasd gubergren, no sea takimata diam ' ..
            'sanctus lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed ' ..
            'nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, ' ..
            'sed diam voluptua. At vero eos et accusam et justo duo dolores et ea ' ..
            'rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ' ..
            'ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing ' ..
            'elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna ' ..
            'aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo ' ..
            'dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus ' ..
            'est Lorem ipsum dolor sit amet.'
        )
    }),

    snippet('dorem', {
        t(
            'Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien ' ..
            'leben die Blindtexte. Abgeschieden wohnen Sie in Buchstabhausen an der Küste ' ..
            'des Semantik, eines großen Sprachozeans. Ein kleines Bächlein namens Duden ' ..
            'fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ' ..
            'ein paradiesmatisches Land.'
        )
    }),

    snippet('ddorem', {
        t(
            'Weit hinten, hinter den Wortbergen, fern der Länder Vokalien und Konsonantien ' ..
            'leben die Blindtexte. Abgeschieden wohnen Sie in Buchstabhausen an der Küste ' ..
            'des Semantik, eines großen Sprachozeans. Ein kleines Bächlein namens Duden ' ..
            'fließt durch ihren Ort und versorgt sie mit den nötigen Regelialien. Es ist ' ..
            'ein paradiesmatisches Land, in dem einem gebratene Satzteile in den Mund ' ..
            'fliegen. Nicht einmal von der allmächtigen Interpunktion werden die Blindtexte ' ..
            'beherrscht – ein geradezu unorthographisches Leben. Eines Tages aber beschloß ' ..
            'eine kleine Zeile Blindtext, ihr Name war Lorem Ipsum, hinaus zu gehen in die ' ..
            'weite Grammatik. Der große Oxmox riet ihr davon ab, da es dort wimmele von ' ..
            'bösen Kommata, wilden Fragezeichen und hinterhältigen Semikoli, doch das ' ..
            'Blindtextchen ließ sich nicht beirren. Es packte seine sieben Versalien, schob ' ..
            'sich sein Initial in den Gürtel und machte sich auf den Weg. Als es die ersten ' ..
            'Hügel des Kursivgebirges erklommen hatte, warf es einen letzten Blick zurück ' ..
            'auf die Skyline seiner Heimatstadt Buchstabhausen, die Headline von ' ..
            'Alphabetdorf und die Subline seiner eigenen Straße, der Zeilengasse. Wehmütig ' ..
            'lief ihm eine rhetorische Frage über die Wange, dann setzte es seinen Weg ' ..
            'fort. Unterwegs traf es eine Copy. Die Copy warnte das Blindtextchen, da, wo ' ..
            'sie herkäme wäre sie zigmal umgeschrieben worden und alles, was von ihrem ' ..
            'Ursprung noch übrig wäre, sei das Wort "und" und das Blindtextchen solle ' ..
            'umkehren und wieder in sein eigenes, sicheres Land zurückkehren. Doch alles ' ..
            'Gutzureden konnte es nicht überzeugen und so dauerte es nicht lange, bis ihm ' ..
            'ein paar heimtückische Werbetexter auflauerten, es mit Longe und Parole ' ..
            'betrunken machten und es dann in ihre Agentur schleppten, wo sie es für ihre ' ..
            'Projekte wieder und wieder mißbrauchten. Und wenn es nicht umgeschrieben ' ..
            'wurde, dann benutzen Sie es immernoch.  zigmal umgeschrieben worden und ' ..
            'alles, was von ihrem Ursprung noch übrig wäre, sei das Wort "und" und das ' ..
            'Blindtextchen solle umkehren und wieder in sein eigenes, sicheres Land ' ..
            'zurückkehren. Doch alles Gutzureden konnte es nicht überzeugen und so dauerte ' ..
            'es nicht lange, bis ihm ein paar heimtückische Werbetexter auflauerten, es ' ..
            'mit Longe und Parole betrunken machten und es dann in ihre Agentur schleppten, ' ..
            'wo sie es für ihre Projekte wieder und wieder mißbrauchten. Und wenn es nicht ' ..
            'umgeschrieben wurde, dann benutzen Sie es immernoch.'
        )
    }),
}
