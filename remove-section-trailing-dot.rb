# https://github.com/asciidoctor/asciidoctor-pdf/issues/858#issuecomment-337217358

require 'asciidoctor-pdf' unless defined? ::Asciidoctor::Pdf

module AsciidoctorPdfSectionExtensions
  def numbered_title opts = {}
    unless (@cached_numbered_title ||= nil)
      if (slevel = (@level == 0 && @special ? 1 : @level)) == 0
        @is_numbered = false
        @cached_numbered_title = @cached_formal_numbered_title = title
      elsif @numbered && !@caption && slevel <= (@document.attr 'sectnumlevels', 3).to_i
        @is_numbered = true
        @cached_numbered_title = %(#{sectnum('.', false)} #{title}) # <----- HERE
        @cached_formal_numbered_title = if slevel == 1 && @document.doctype == 'book'
          %(#{@document.attr 'chapter-label', 'Chapter'} #{@cached_numbered_title}).lstrip
        else
          @cached_numbered_title
        end
      else
        @is_numbered = false
        @cached_numbered_title = @cached_formal_numbered_title = captioned_title
      end
    end
    opts[:formal] ? @cached_formal_numbered_title : @cached_numbered_title
  end
end

Asciidoctor::Section.prepend AsciidoctorPdfSectionExtensions
