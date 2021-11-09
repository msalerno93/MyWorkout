# @musclegroup = Musclegroup.create(name: "Mike")


# Workout.create({title: "Chest", muscle: "Pectoral", musclegroup_id: @musclegroup.id})

Workout.create([
    { title: "Barbell Chest Press", muscle: "Pectorals"},
    { title: "Dumbbell Curl", muscle: "Biceps"},
    { title: "Skullcrushers", muscle: "Triceps"},
    { title: "Deadlift", muscle: "Back"},
])