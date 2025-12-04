from behave import given, when, then
from scripts.forklift import Forklift
from scripts.warehouse import Warehouse


@given(u'a TP roll with {count:d} neighbor(s) TP roll')
def step_impl(context, count):
    if not (0 <= count <= 8):
        raise ValueError("count must be between 0 and 8")

    warehouse = [[ '.' for _ in range(3)] for _ in range(3)]
    warehouse[1][1] = '@'
    neighbours_coords = [
        (0,0),(1,0),(2,0),
        (0,1),(2,1),
        (0,2),(1,2),(2,2),
    ]
    for i in range(count):
        c, r = neighbours_coords[i]
        warehouse[r][c] = '@'

    context.world = (Warehouse(warehouse), (1,1))

@when(u'I try to remove it with my forklift')
def step_impl(context):
    warehouse_obj, position = context.world
    forklift = Forklift()
    neighbors_count_map = warehouse_obj.create_neighbor_count_map()
    removed = forklift.lift(warehouse_obj.get_grid(), position, neighbors_count_map)
    context.removed = bool(removed)

@then(u'the TP roll is removed')
def step_impl(context):
    assert getattr(context, 'removed', False) is True, "Expected TP roll to be removed"

@then(u'the TP roll remains')
def step_impl(context):
    assert getattr(context, 'removed', False) is False, "Expected TP roll to remain"

@given(u'the following warehouse configuration:')
def step_impl(context):
    lines = [line.rstrip() for line in context.text.splitlines() if line.strip() != ""]
    context.warehouse = Warehouse([list(line) for line in lines])

@when(u'I scan it to see which ones I can lift')
def step_impl(context):
    forklift = Forklift()
    removed = 0
    grid = context.warehouse.get_grid()
    neighbors_count_map = context.warehouse.create_neighbor_count_map()
    for row_idx in range(len(grid)):
        for col_idx in range(len(grid[row_idx])):
            if forklift.lift(grid, (col_idx, row_idx), neighbors_count_map):
                removed += 1
    context.removed = removed

@then(u'{expected:d} rolls can be removed')
def step_impl(context, expected):
    assert getattr(context, "removed", 0) == expected, f"expected {expected}, got {context.removed}"