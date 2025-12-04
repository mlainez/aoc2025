def before_all(context):
    context._bdd_setup = True

def after_all(context):
    context._bdd_setup = False
