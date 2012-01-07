
public void ptasFunction()
{
    bool [] tmp = new bool[tasksCount];

    Array.Sort(tasks);
    Array.Reverse(tasks);

    if (!(eps > 1.0/3.0))
    {
        best = getTime(tmp, k);
        while (getPermutation(tmp))
        {
            int tmpTime = getTime(tmp, k);
            if (best > tmpTime)
            {
                best = tmpTime;
                Array.Copy(tmp, optimal, k);
            }
        }
    }
    else
    {
        k = 0;
    }
    for (int i = k; i < tasksCount; i++)
    {
        if (!freeCpu(i + 1))
        {
            optimal[i] = true;   
        }
    }
}


private bool getPermutation(bool[] tab)
{
    for(int i=0; i < k; i++)
    {
        if (tab[i])
        {
            tab[i] = false;
        }
        else
        {
            tab[i] = true;
            return true;
        }
    }
    return false;
}