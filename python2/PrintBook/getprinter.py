import cups


CONNECT = cups.Connection()


def _choice_printer():
    printers = [printer for printer in CONNECT.getPrinters()]

    for printer in printers:
        print('\t{0}: {1}'.format(printers.index(printer), printer))

    index = int(raw_input('Select the printer: '))

    return printers[index]


def get_printer(default=True):
    c = cups.Connection()
    if default:
        printer = c.getDefault()
    else:
        printer = _choice_printer()
    return printer
