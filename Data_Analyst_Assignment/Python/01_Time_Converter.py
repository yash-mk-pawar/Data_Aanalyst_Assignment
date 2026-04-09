def convertIntoHumanReadableForm(n):
    hours=n//60
    minutes=n%60
    if hours > 0 and minutes > 0:
        return f"{hours} hr {minutes} minutes"
    elif hours > 0:
        return f"{hours} hr"
    else:
        return f"{minutes} minutes"


Num=int(input())
print(convertIntoHumanReadableForm(Num))