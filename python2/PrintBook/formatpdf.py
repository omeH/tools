import sys
import PyPDF2 as pdf


FIRST_PAGE = 3
COUNT_PAGES = 4


def first_page(inpdf, outpdf):
    for index in range(0, FIRST_PAGE):
        outpdf.addPage(inpdf.getPage(index))
    outpdf.addBlankPage()


def last_page(inpdf, outpdf, start):
    start += FIRST_PAGE
    residue = inpdf.getNumPages() - start
    if residue == 2:
        outpdf.addPage(inpdf.getPage(start + 0))
        outpdf.addBlankPage()
        outpdf.addBlankPage()
        outpdf.addPage(inpdf.getPage(start + 1))
    elif residue == 3:
        outpdf.addPage(inpdf.getPage(start + 0))
        outpdf.addPage(inpdf.getPage(start + 2))
        outpdf.addBlankPage()
        outpdf.addPage(inpdf.getPage(start + 1))
    elif residue == 1:
        outpdf.addPage(inpdf.getPage(start + 0))


def format_pdf(inpdf, outpdf, start, end):
    for index in range(start, end, COUNT_PAGES):
        outpdf.addPage(inpdf.getPage(index + 0))
        outpdf.addPage(inpdf.getPage(index + 2))
        outpdf.addPage(inpdf.getPage(index + 3))
        outpdf.addPage(inpdf.getPage(index + 1))


def number_last_page(size):
    size -= FIRST_PAGE
    return size - size % COUNT_PAGES


def format_file(infile, outfile):
    fin = open(infile, 'rb')
    inpdf = pdf.PdfFileReader(fin)
    outpdf = pdf.PdfFileWriter()

    sizepdf = inpdf.getNumPages()

    first_page(inpdf, outpdf)
    start = FIRST_PAGE
    end = number_last_page(sizepdf)

    format_pdf(inpdf, outpdf, start, end)

    last_page(inpdf, outpdf, end)

    with open(outfile, 'wb') as fout:
        outpdf.write(fout)


if __name__ == '__main__':
    infile = sys.argv[1]
    outfile = sys.argv[2]
    format_file(infile, outfile)
