#' Do highlighting searches, outputing highlight only.
#' 
#' @import httr XML
#' @importFrom plyr compact
#' @template high
#' @return A list.
#' @seealso \code{\link{solr_search}}, \code{\link{solr_facet}}
#' @references See \url{http://wiki.apache.org/solr/HighlightingParameters} for 
#' more information on highlighting.
#' @examples \dontrun{
#' url <- 'http://api.plos.org/search'
#' key = getOption('PlosApiKey')
#' 
#' solr_highlight(q='alcohol', hl.fl = 'abstract', rows=10, url = url, key=key)
#' solr_highlight(q='alcohol', hl.fl = 'abstract,title', rows=3, url = url, key=key)
#' }
#' @export

solr_highlight <- function(q, hl.fl = NULL, hl.snippets = NULL, hl.fragsize = NULL,
     hl.q = NULL, hl.mergeContiguous = NULL, hl.requireFieldMatch = NULL, 
     hl.maxAnalyzedChars = NULL, hl.alternateField = NULL, hl.maxAlternateFieldLength = NULL, 
     hl.preserveMulti = NULL, hl.maxMultiValuedToExamine = NULL, 
     hl.maxMultiValuedToMatch = NULL, hl.formatter = NULL, hl.simple.pre = NULL, 
     hl.simple.post = NULL, hl.fragmenter = NULL, hl.fragListBuilder = NULL, 
     hl.fragmentsBuilder = NULL, hl.boundaryScanner = NULL, hl.bs.maxScan = NULL, 
     hl.bs.chars = NULL, hl.bs.type = NULL, hl.bs.language = NULL, hl.bs.country = NULL, 
     hl.useFastVectorHighlighter = NULL, hl.usePhraseHighlighter = NULL, 
     hl.highlightMultiTerm = NULL, hl.regex.slop = NULL, hl.regex.pattern = NULL, 
     hl.regex.maxAnalyzedChars = NULL, start = 0, rows = NA, 
     wt='json', key = NULL, url = NULL, callopts=list())
{
  args <- compact(list(wt=wt, q=q, start=start, rows=rows, hl='true', hl.fl=hl.fl,
     hl.snippets=hl.snippets, hl.fragsize=hl.fragsize, fl='DOES_NOT_EXIST',
     hl.mergeContiguous = hl.mergeContiguous, hl.requireFieldMatch = hl.requireFieldMatch, 
     hl.maxAnalyzedChars = hl.maxAnalyzedChars, hl.alternateField = hl.alternateField, 
     hl.maxAlternateFieldLength = hl.maxAlternateFieldLength, hl.preserveMulti = hl.preserveMulti, 
     hl.maxMultiValuedToExamine = hl.maxMultiValuedToExamine, hl.maxMultiValuedToMatch = hl.maxMultiValuedToMatch, 
     hl.formatter = hl.formatter, hl.simple.pre = hl.simple.pre, hl.simple.post = hl.simple.post, 
     hl.fragmenter = hl.fragmenter, hl.fragListBuilder = hl.fragListBuilder, hl.fragmentsBuilder = hl.fragmentsBuilder, 
     hl.boundaryScanner = hl.boundaryScanner, hl.bs.maxScan = hl.bs.maxScan, hl.bs.chars = hl.bs.chars, 
     hl.bs.type = hl.bs.type, hl.bs.language = hl.bs.language, hl.bs.country = hl.bs.country, 
     hl.useFastVectorHighlighter = hl.useFastVectorHighlighter, hl.usePhraseHighlighter = hl.usePhraseHighlighter, 
     hl.highlightMultiTerm = hl.highlightMultiTerm, hl.regex.slop = hl.regex.slop, hl.regex.pattern = hl.regex.pattern, 
     hl.regex.maxAnalyzedChars = hl.regex.maxAnalyzedChars)) 
  tt <- GET(url, query = args, callopts)
  stop_for_status(tt)
  out <- content(tt)$highlighting
  return( out )
}