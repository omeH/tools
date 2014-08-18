"""Transitive restart nested modules
"""
import types


def status(module):
    print('reloading' + module.__name__)


def transitive_realod(module, visited):
    if not module in visited:
        status(module)
        reload(module)
        visited[module] = None
        for attr_obj in module.__dict__.values():
            if type(attr_obj) == types.ModuleType:
                transitive_realod(attr_obj, visited)


def reload_all(*args):
    visited = {}
    for arg in args:
        if type(arg) == types.ModuleType:
            transitive_realod(arg, visited)


if __name__ == '__main__':
    import reloadall
    reload_all(reloadall)
