#####################################
## Name: Riley Payung
## G-#: 01000669
## Assignment: 3
#####################################

print("#####################################\n## Name: Riley Payung\n## G-#: 01000669\n## Assignment: 3\n#####################################");

print("**********************************************************************")
#import sets:
import math;

#Question 1:
num_of_character = 10;
character_to_print = "*";
i = num_of_character;

print("**Question #1**\n");

while (num_of_character > 0):
    i = 10;
    while i > 0:
        if (i > num_of_character):
            print(end=" ");
        else:
            print(end=character_to_print);
        i -= 1;
    print();
    num_of_character -= 1;
print("**********************************************************************")
#Question 2:

loc_1 = (38.778981, -77.083358);
loc_2 = (38.288876, -77.345637);
r = 6372.8;

dLat = math.radians(loc_2[0] - loc_1[0])
dLon = math.radians(loc_2[1] - loc_1[1])

result = 2 * r * math.asin(math.sqrt(math.sin(dLat / 2)**2 + math.cos(math.radians(loc_1[0])) * math.cos(math.radians(loc_2[0])) * math.sin(dLon / 2) ** 2));

# Something that I did not consider was converting to radians. I had trouble until I read the directions again.

print("**Question #2**\nDisplacement:",result,"km");

print("**********************************************************************")
# Question 3

trajectory = []
trajectory.append((38.85331685786827, -77.29046729646763))
trajectory.append((38.85866393991506, -77.27192786775669))
trajectory.append((38.857594555667404, -77.26094153963169))
trajectory.append((38.84957366123777, -77.25270179353794))
trajectory.append((38.84422589578141, -77.2396555288895))
trajectory.append((38.838877728341515, -77.24995521150669))
trajectory.append((38.838877728341515, -77.26231483064731))
trajectory.append((38.838877728341515, -77.28978065095981))
trajectory.append((38.84743460329428, -77.28978065095981))

CM_x_n = len(trajectory);
CM_y_n = len(trajectory);
CM_x_avg = 0.0;
CM_y_avg = 0.0;

for i in trajectory:
    CM_x_avg += i[0];
    CM_y_avg += i[1];

CM_x = (1/CM_x_n)*CM_x_avg;
CM_y = (1/CM_y_n)*CM_y_avg;

CM = (CM_x,CM_y);

print ("**Question #3**\nCenter of Mass:",CM);

print("**********************************************************************")
# Question 4
#displacement(location1, cm).
def displacement(location1,center):
    dLatitude = math.radians(center[0]-location1[0]);
    dLongitude = math.radians(center[1]-location1[1]);
    result = 2 * r * math.asin(math.sqrt(math.sin(dLatitude / 2)**2 + math.cos(math.radians(location1[0])) * math.cos(math.radians(center[0])) * math.sin(dLongitude / 2) ** 2));
    return result; #in km.

distances_from_center_of_mass = [];

for i in trajectory:
    distances_from_center_of_mass.append(displacement(i,CM));

sumDistance = 0;

for i in distances_from_center_of_mass:
    sumDistance += i**2;

rg = math.sqrt((1/len(distances_from_center_of_mass)) * sumDistance);


print ("**Question #4**\nRadius of Gyration:",rg,"km.");


print("**********************************************************************")
# Question 5

temps = [80,87,86,92,78,78,83,81,82,85,93,94,75,79,85,90,80,78,72,80,88,90,92,78,82,62];
predicted = [];
average_temp = 0;

count = 0;
i = 0;

while i < 15:
    while count < 10:
        temp = temps[len(temps)-count - 1];
        average_temp += temp;
        count += 1;
    count = 0;
    average_temp = average_temp / 10;
    predicted.append(average_temp)
    temps.append(average_temp);
    average_temp = 0;
    i += 1;

print ("**Question #5**\nPredicted Temperatures:");

for i in range(len(predicted)):
    print("Day %d:\t%.3f degrees"%(i+1,predicted[i]));

real15 = [81,89,88,78,83,92,90,71,67,70,69,69,69,69,70]
differences = []

for pred,real in zip(predicted,real15):
    differences.append(pred - real);

print("**********************************************************************")
print ("**Question #6**\nDifferences between predicted and real Temperatures:");

average_of_differences = 0;

for i in range(len(differences)):
    print("Day %d:\t%.3f - %d = \t%.3f\tdegrees" % (i+1,predicted[i],real15[i],differences[i]));
    average_of_differences += abs(differences[i]);
average_of_differences = average_of_differences/len(differences);
print("Average difference: %.3f degrees" % (average_of_differences));
print("The model I built is not very good considering the average difference in temperature was %.3f degrees,\nmeaning there was a huge margin of error making the model completely inaccurate. I think that the model could be dramatically improved, simply by coming up with a more efficient equation."%(average_of_differences));
